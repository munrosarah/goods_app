# == Schema Information
#
# Table name: products
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  variety    :string(255)
#  price      :float
#  desc       :string(255)
#  image      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Product do
  
  let(:user) { FactoryGirl.create(:user) }
  before { @product = user.products.build(name: "Example Product", variety: "Single Card", price: 5.50, desc: "Example Description", image: 'example.png') }
  
  subject { @product }
  
  it { should respond_to(:name) }
  it { should respond_to(:variety) }
  it { should respond_to(:price) }
  it { should respond_to(:desc) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  
  it { should be_valid }
  
  describe "when user_id is not present" do
    before { @product.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "when name is not present" do
    before { @product.name = " "}
    it { should_not be_valid }
  end
  
  describe "when product name is already taken" do
    before do
      product_with_same_name = @product.dup
      product_with_same_name.name = @product.name.upcase
      product_with_same_name.save
    end
    
    it { should_not be_valid }
  end
  
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Product.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)    
    end
  end
end
