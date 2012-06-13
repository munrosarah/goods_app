require 'spec_helper'

describe "Product pages" do
  
  subject { page }

  describe "product description page" do
    let(:product) {FactoryGirl.create(:product)}
    before { visit product_path(product) }
    
    it { should have_selector('h1', text: product.name) }
    it { should have_selector('title', text: product.name) }
    
  end
  
  describe "add new product" do 
  
    before { visit new_product_path }
    
    let(:submit) { "Create a product" }
    
    describe "with invalid information" do
      it "should not create a product" do
        expect { click_button submit }.not_to change(Product, :count)
      end
    end
    
    describe "with valid information" do
      before do
        fill_in "Name",       with: "Example Product"
        fill_in "Variety",    with: "Example Variety"
        fill_in "Price",      with: 5.54
        fill_in "Desc",       with: "Example Description"
        fill_in "Image",      with: "example.png"
        fill_in "Thumbnail",  with: "examplethumb.png"
      end
      
      it "should create a new product" do
        expect { click_button submit }.to change(Product, :count).by(1)
      end  
    end
  end
end
