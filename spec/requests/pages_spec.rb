require 'spec_helper'

describe "Pages" do
  describe "Article page" do
    it "should have h1 with 'Article Example'" do
      visit article_path
      page.should have_selector('h1', :text => 'Article Example')
    end
    it "should have basic structure" do
      visit article_path
      page.should have_selector('nav')
      page.should have_selector('article')
      page.should have_selector('footer')
    end
    it "should have a tags section" do
      visit article_path
      page.should have_selector('aside.tags')
    end
  end
  
end
