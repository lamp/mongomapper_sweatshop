require 'spec_helper'

describe MongoMapperSweatShop::Model::ClassMethods do
  
  subject do
    class User
      include MongoMapper::Document
    end
  end 
  
  it { should_not be_nil }
  
  context "method definition" do
    %w(gen generate fix make).each do |method|
    
      specify "#{method}" do
        subject.respond_to?(method).should eq(true)
      end
    end
  end
  
  context "fixture creation" do
    
    subject do
      class User
        include MongoMapper::Document
      end
    end
    
    let :attrs do
      { foo: 'bar' }
    end
    
    let :callable do
      proc { attrs }
    end
    
    specify do
      expect do
        User.fix { attrs }
      end.to_not raise_error
    end
    
    specify do
      MongoMapperSweatShop::SweatShop.should_receive(:[]=)
      User.fix { attrs }
    end
    
    specify do
      MongoMapperSweatShop::SweatShop.should_receive(:[]=).with(User, :default, callable)
      User.fix callable
    end
  end
  
  context "fixture generation" do
    
    context "making a new instance" do
      
      before :all do
        User.fix do
          { foo: 'bar' }
        end
      end
      
      subject do
        class User
          include MongoMapper::Document
          
          key :foo, String
        end
      end
      
      specify do
        expect do
          User.make
        end.to_not raise_error
      end
      
      specify do
        User.make.attributes.should include({ foo: 'bar' })
      end
      
      context "with overrides" do
        specify do
          User.make({ bar: 'foo' }).attributes.should include({ foo: 'bar', bar: 'foo' })
        end
      end
    end
    
    context "creating a new instance" do
      
    end
  end
end
