module MMSweatShop
  extend ActiveSupport::Concern
  
  module ClassMethods
    
    @@fixtures = {}
    def fix name=:default, &block
      @@fixtures[name] = block.call
    end
    
    def gen name=:default, overrides={}  
      self.create @@fixtures[name].merge(overrides)
    end
    
    def make name=:default, overrides={}
      self.new @@fixtures[name].merge(overrides)
    end
  end
  
end
MongoMapper::Document.plugin(MMSweatShop)