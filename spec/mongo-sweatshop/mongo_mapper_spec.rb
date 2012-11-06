require 'spec_helper'

describe MongoMapperSweatShop do
  
  context "embedded document inclusion" do
    subject do
      class Foo
        include MongoMapper::EmbeddedDocument
      end
    end
    
    %w(fix gen make).each do |method|
      it do
        should respond_to(method.to_sym)
      end
    end
  end
  
  context "document inclusion" do
    subject do
      class Foo
        include MongoMapper::Document
      end
    end
    %w(fix gen make).each do |method|
      it do
        should respond_to(method.to_sym)
      end
    end
  end
end