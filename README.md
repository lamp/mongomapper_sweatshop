MongoMapper Sweatshop, Extracted from @goalsforgiving
====================================================


###Requirements

* mongo_mapper



#### Installation: (Gemfile)
    gem "mongo-sweatshop"


####Usage:

    User.fix {
      {
        #randexp is included for you
        name: /\w+/.gen,
        email: /\w@\w\.com/.gen
      }
    }


