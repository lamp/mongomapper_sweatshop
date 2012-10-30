require 'mongo_mapper'
require 'randexp'
require 'active_support'
require 'simplecov'
SimpleCov.start
require 'mongo-sweatshop'
require 'database_cleaner'

Randexp::Dictionary.load_dictionary

RSpec.configure do |config|
  
  MongoMapper.connection = Mongo::Connection.new('localhost', 27017, :pool_size => 5, :pool_timeout => 5)
  MongoMapper.database = 'test_db'
  
  config.before :suite do
    DatabaseCleaner[:mongo_mapper].strategy = :truncation
  end
  
  config.after :suite do
    DatabaseCleaner.clean_with(:truncation)
  end 
  
end