require 'mongo_mapper'
require 'randexp'
require 'active_support'
require 'simplecov'
SimpleCov.start
require 'mongo-sweatshop'

MongoMapper.connection = Mongo::Connection.new('localhost', 27017, :pool_size => 5, :pool_timeout => 5)
MongoMapper.database = 'test_db'
Randexp::Dictionary.load_dictionary