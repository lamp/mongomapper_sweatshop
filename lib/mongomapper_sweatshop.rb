require File.dirname(__FILE__) + '/mongomapper-sweatshop/sweatshop'
require File.dirname(__FILE__) + '/mongomapper-sweatshop/model'

module MongoMapperSweatShop
  extend ActiveSupport::Concern
  
  include MongoMapperSweatShop::Model
end
MongoMapper::Document.plugin(MongoMapperSweatShop)
MongoMapper::EmbeddedDocument.plugin(MongoMapperSweatShop)