MongoMapper Sweatshop, Extracted from @goalsforgiving
====================================================

https://github.com/datamapper/dm-sweatshop/ shamelessly rewritten for mongo_mapper 

####Requirements

* mongo_mapper

#### Installation: (Gemfile)
    gem "mongomapper-sweatshop", require: 'mongomapper_sweatshop'

####Usage:

    User.fix {
      {
        #randexp is included for you
        name: /\w+/.gen,
        email: /\w@\w\.com/.gen
      }
    }

    # create a user (#create)
    User.gen
    
    # make a user (#new)
    User.make
    

