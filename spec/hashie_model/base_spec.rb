require 'spec_helper'

describe HashieModel::Base do
  it_behaves_like "ActiveModel"
  
  class FooModel < HashieModel::Base
    prop :x
    prop :y, HashieModel::Money
    prop :z, HashieModel::Money
    
    validates_presence_of :x
    validates_numericality_of :y
  end
  
  ArrayOfFoo = HashieModel.array_of(FooModel)
  
  class BarModel < HashieModel::Base
    prop :must_have, :required => true
    prop :cash, HashieModel::Money
    prop :foos, ArrayOfFoo
    
    validates_associated :foos
  end
  
  let(:foo) {
    FooModel.new({
      :x => 'x-value',
      :y => '75.95'
    })
  }
  
  let(:bar) {
    BarModel.new({
      :must_have => "here",
      :cash      => "42.00",
      :foos      => [foo]
    })
  }
  
  describe "#persisted?" do
    let(:component) { HashieModel::Base.new }
    subject { component.persisted? }
    
    it { should be_false }
  end

  describe "#dup" do
    it "returns a duplicate" do
      foo.dup.should == FooModel.new({
        :x => 'x-value',
        :y => '75.95'
      })
    end
  end

  describe "#merge" do
    it "merges the attributes" do
      foo.merge(:x => 'alt-x').should == FooModel.new({
        :x => 'alt-x',
        :y => '75.95'
      })
    end
  end
  
  describe "properties" do
    describe "#prop" do
      it "defines accessor methods" do
        foo.x.should == "x-value"
        foo.x = "42"
        foo.x.should == "42"
        foo[:x].should == "42"
      end
      
      it "defines presence methods" do
        foo.z?.should be_false
        foo.z = '12'
        foo.z?.should be_true
      end
      
      it "performs coercion" do
        foo.z = "abc"
        foo.z.should == 0
      end
      
      it "retains values before type cast" do
        foo.z = "abc"
        foo.z_before_type_cast.should == "abc"
      end
    end
    
    subject { bar }
    
    it { should have_property(:must_have, :required => true) }
    it { should have_property(:cash, HashieModel::Money) }
  end
  
  describe "HashieModel.array_of" do
    subject { bar }
    
    it { should have_property(:foos, ArrayOfFoo) }
    it { foo.should act_as_array(ArrayOfFoo) }
  end
  
  describe "validations" do
    subject { foo }
    
    it { should validate_presence_of(:x) }
    it { should validate_numericality_of(:y) }
    
    context "associated" do
      subject { bar }
      
      it { should validate_associated(:foos) }
      
      it "nests errors on associations" do
        invalid_foo = FooModel.new
        subject.foos = [invalid_foo]
        
        invalid_foo.valid?
        
        subject.valid?
        subject.errors[:foos].map(&:full_messages).should == [invalid_foo.errors.full_messages]
      end
    end
  end
  
  describe "JSON serialization" do
    let(:json) {
      <<-JSON
      {
        "must_have" : "here",
        "cash"      : "42.00",
        "foos" : [
          {
            "x" : "x-value",
            "y" : "75.95"
          }
        ]
      }
      JSON
    }
    
    subject { bar }
    
    it { should serialize_to(json) }
    it { should deserialize_from(json) }
  end
  
  describe "YAML serialization" do
    let(:yaml) {
      <<-YAML.gsub(/^\s{6}/m, '')
      --- !ruby/object:BarModel
      must_have: here
      cash: !ruby/object:HashieModel::Money
        cents: 4200
        currency: !ruby/object:Money::Currency
          id: :usd
          priority: 1
          iso_code: USD
          name: United States Dollar
          symbol: $
          subunit: Cent
          subunit_to_unit: 100
          symbol_first: true
          html_entity: $
          decimal_mark: .
          thousands_separator: ! ','
        bank: &70263216595100 !ruby/object:Money::Bank::VariableExchange
          rounding_method: 
          rates: {}
          mutex: !ruby/object:Mutex {}
      foos:
      - !ruby/object:FooModel
        x: x-value
        y: !ruby/object:HashieModel::Money
          cents: 7595
          currency: !ruby/object:Money::Currency
            id: :usd
            priority: 1
            iso_code: USD
            name: United States Dollar
            symbol: $
            subunit: Cent
            subunit_to_unit: 100
            symbol_first: true
            html_entity: $
            decimal_mark: .
            thousands_separator: ! ','
          bank: *70263216595100
      YAML
    }
    
    subject { bar }
    
    it { should yaml_serialize_to(yaml) }
    it { should yaml_deserialize_from(yaml) }
    
  end
end
