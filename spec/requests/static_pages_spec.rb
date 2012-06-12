require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title', text: 'Home')
    end
  end
end
