require 'mongo-sweatshop/sweatshop'
require 'mongo-sweatshop/model'

module MongoSweatShop
  extend ActiveSupport::Concern
  
  include MongoSweatShop::Model
  
  included do
    
  end
end
MongoMapper::Document.plugin(MongoSweatShop)