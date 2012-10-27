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
end
