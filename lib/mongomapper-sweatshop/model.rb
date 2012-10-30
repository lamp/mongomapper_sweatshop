module MongoMapperSweatShop
  module Model
    
    module ClassMethods
    
      @@fixtures = {}
      
      # Creates a fixture
      # @param name [Symbol] fixture name, :default is default
      # @param block [Proc] the fixture to be lazily evaluated
      # @return [Proc] the block passed
      def fix name=:default, &block
        if name.is_a? Proc
          block, name = name, :default
        end
        SweatShop[self, name] = block
        #@@fixtures[name] = block
      end
      alias :fixture :fix
      
      # Generates a fixture and saves it to the test db
      # @param name [Symbol] name of fixture, :default is default
      # @param overrides [Hash] hash of attributes to override what may be defined in the fixture
      # @return [Class] instance of the class this is currently included
      def gen name=:default, overrides={}  
        self.create SweatShop[self, name, overrides]
      end
      alias :generate :gen
      
      
      # Generates a fixture without saving to the db
      # @param name [Symbol] name of fixture, :default is default
      # @param overrides [Hash] Hash of attributes to merge into the generated fixture
      # @return [Class] instance of the class 
      def make name=:default, overrides={}
        self.new SweatShop[self, name, overrides]
      end
      
    end
  end
end
