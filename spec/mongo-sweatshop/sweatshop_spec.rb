require 'spec_helper'
describe MongoSweatShop::SweatShop do
  
  before :each do
    class User; end
  end
  
  subject { described_class }
  
  it { should_not be_nil }
  
  context "method definition" do
    %w([] []=).each do |method|
      
      it do
        should respond_to(method)
      end
    end
  end
  
  context "define fixture" do
    
    let :callable do
      proc { { foo: 'bar' }}
    end
    
    specify do
      expect do
        subject[User, :default]= callable
      end.to_not raise_error
    end
    
    specify do
      (subject[User, :default]=(callable)).should eq(callable)
    end
    
    context "optional arguments" do
      
      specify do
        (subject[User]=(callable)).should eq(callable)
      end
      
      specify do
        expect do
          (subject[User]=(callable)).should eq(callable)
        end.to_not raise_error
      end
    end
    
    context "corect storage" do
      
    end
    
  end
  
  context "getting a fixture" do
    
    let :callable do
      proc { { foo: 'bar' }}
    end
    
    before :all do
      subject[User, :default]= callable
    end
    
    specify do
      expect do
        subject[User, :default]
      end.to_not raise_error
    end
  end
end