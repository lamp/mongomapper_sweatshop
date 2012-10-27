module MongoSweatShop
  module Model
    
    module ClassMethods
    
      @@fixtures = {}
      def fix name=:default, &block
        @@fixtures[name] = block
      end
      alias :fixture :fix
      
      def gen name=:default, overrides={}  
        self.create @@fixtures[name].call.merge(overrides)
      end
      alias :generate :gen
      
      def make name=:default, overrides={}
        self.new @@fixtures[name].merge(overrides)
      end
      
    end
  end
end
