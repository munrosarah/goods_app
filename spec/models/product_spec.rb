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
  before { @product = Product.new(name: "Example Product", variety: "Single Card", price: 5.50, desc: "Example Description", image: 'example.png')}
  
  subject { @product }
  
  it { should respond_to(:name) }
  it { should respond_to(:variety) }
  it { should respond_to(:price) }
  it { should respond_to(:desc) }
  
  it { should be_valid }
  
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
end
