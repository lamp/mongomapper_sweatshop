# @author lamp
module MongoSweatShop
  class SweatShop
    
    # the model to fixture map
    # @!attribute [rw] models
    #   @return [Hash] Hash of models to scopes and their lazily loaded attributes
    @@models = {}
    
    class NoFixtureError < Exception; end
    
    class << self
      
      # Stores a fixture
      # @param klass [Class] klass is the class to provide a fixture
      # @param name [Symbol] defines the scope of the fixture, defaults to :default
      # @param proc [Proc] the attribute list to lazily evaled
      # @return [Proc] The proc originally passed
      def []= klass, name=:default, proc
        ((@@models[klass] ||= {})[name] ||= []) << proc
      end
      
      # Gets a fixture
      # @param klass [Class] The class to scope the fixture query by
      # @param name [Symbol] the fixture name to scope the query by
      # @param overrides [Hash] the overrides that may be provided
      # @return [Mixed] the results of the proc, or false
      def [] klass, name=:default, overrides={}
        overrides, name = name, :default if name.is_a? Hash
        @@models[klass][name].last.call.merge(overrides)
      rescue NoFixtureError
        puts "A fixture with that name has not been defined, using the default"
        @@models[klass][:default].last.call.merge(overrides)
      end
    end
  end
end