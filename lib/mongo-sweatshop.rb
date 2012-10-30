require File.dirname(__FILE__) + '/mongo-sweatshop/sweatshop'
require File.dirname(__FILE__) + '/mongo-sweatshop/model'

module MongoSweatShop
  extend ActiveSupport::Concern
  
  include MongoSweatShop::Model
  
  included do
    
  end
end
MongoMapper::Document.plugin(MongoSweatShop)