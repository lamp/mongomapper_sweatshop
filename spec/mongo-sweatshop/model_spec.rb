require 'spec_helper'

describe MongoSweatShop::Model::ClassMethods do
  
  subject do
    class User
      extend MongoSweatShop::Model::ClassMethods
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
      MongoSweatShop::SweatShop.should_receive(:[]=)
      User.fix { attrs }
    end
    
    specify do
      MongoSweatShop::SweatShop.should_receive(:[]=).with(User, :default, callable)
      User.fix callable
    end
  end
  
  context "fixture generation" do
    
    context "making a new instance" do
      
    end
    
    context "creating a new instance" do
      
    end
  end
end
