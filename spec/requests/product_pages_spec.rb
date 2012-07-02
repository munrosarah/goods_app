require 'spec_helper'

describe "Product pages" do
  
  subject { page }

  describe "index" do
    
    let(:product) { FactoryGirl.create(:product) }
    
    before(:all) { 18.times {FactoryGirl.create(:product) } }
    after(:all) { Product.delete_all }
    
    before(:each) do
      visit products_path
    end
    
    it { should have_selector('title', text: 'All products') }
    it { should have_selector('h1', text: 'All products') }
    
    describe "pagination" do
      
      it { should have_selector('div.pagination') }
      
      it "should display each product" do
        Product.paginate(page: 1, per_page: 12).each do |product|
          page.should have_selector('a', text: product.name)
        end
      end
    end
  end
  
  describe "product description page" do
    let(:product) {FactoryGirl.create(:product)}
    before { visit product_path(product) }
    
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
        select 'Single Card', from: "Variety"
        fill_in "Price",      with: 5.54
        fill_in "Desc",       with: "Example Description"
        select 'example.png', from: "Image"
      end
      
      it "should create a new product" do
        expect { click_button submit }.to change(Product, :count).by(1)
      end  
    end
  end
  
  describe "edit" do
    let(:product) { FactoryGirl.create(:product) }
    before { visit edit_product_path(product) }
    
    describe "page" do
      it { should have_selector('h1', text: "Edit this Product") }
      it { should have_selector('title', text: "Edit this Product") }
    end
    
    #!!!!!!!!!!!!!ADD LOGIN HERE WHERE THE PASSWORD IS BLANK
    #describe "with invalid information" do      
    #  before {click_button "Save changes" }
      
    #  it { should have_content('error') }
      
    #end
    
    describe "with valid information" do
    
      let(:new_name) {"New Name"}
      let(:new_variety) {"Card Set"}
      let(:new_price) { 15 }
      let(:new_desc) {"A new description"}
      let(:new_image) {"example.png"}
      
      before do
        fill_in "Name",         with: new_name
        select new_variety,     from: "Variety"
        fill_in "Price",        with: new_price
        fill_in "Description",  with: new_desc
        select new_image,      from: "Image"
        
        click_button "Save changes"
      end
      
      it { should have_selector('title', text: new_name) }
      it { should have_selector('div.alert.alert-success')}
      
      specify { product.reload.name.should == new_name }
      specify { product.reload.variety.should == new_variety }
    end
    
  
  end
end
