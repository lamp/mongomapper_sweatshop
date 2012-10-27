module MongoSweatShop
  class SweatShop
    
    @@models = {}
    
    class NoFixtureError < Exception; end
    
    class << self
      
      def []= klass, name=:default, proc
        ((@@models[klass] ||= {})[name] ||= []) << proc
      rescue
        false
      end
      
      
      def [] klass, name=:default, overrides={}
        p @@models
        @@models[klass][name].last.call.merge(overrides)
      rescue NoFixtureError
        puts "A fixture with that name has been generated, we have used the default"
        self.models[klass][:default].last.call.merge(overrides)
      end
    end
  end
end