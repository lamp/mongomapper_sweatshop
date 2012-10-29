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
      # @return [Mixed] The proc originally passed, false if there was an error
      def []= klass, name=:default, proc
        ((@@models[klass] ||= {})[name] ||= []) << proc
      rescue
        false
      end
      
      # Gets a fixture
      # @param klass [Class] The class to scope the fixture query by
      # @param name [Symbol] the fixture name to scope the query by
      # @return [Mixed] the results of the proc, or false
      def [] klass, name=:default
        @@models[klass][name].last.call
      rescue NoFixtureError
        puts "A fixture with that name has been generated, we have used the default"
        @@models[klass][:default].last.call.merge(overrides)
      end
    end
  end
end