require 'spec_helper'

describe "Static pages" do

  describe "Code page" do

    it "should have the content 'StaticPages#code'" do
      visit code_path
      page.should have_content('StaticPages#code')
    end

    it "should have 'Durion - Code' as title" do
      visit code_path
      page.should have_selector('title', :text => 'Durion - Code')
    end

    it "should have basic CSS selectors" do
      visit code_path
      page.should have_selector('body#code')
      page.should have_selector('div#page-wrapper')
    end
  end

  describe "Talks page" do

    it "should be the root page" do
      visit root_path
      page.should have_selector('h1', :text => 'StaticPages#talks')
    end

    it "should have the content 'StaticPages#talks'" do
      visit talks_path
      page.should have_content('StaticPages#talks')
    end

    it "should have the base title 'Durion'" do
      visit talks_path
      page.should have_selector('title', :text => 'Durion')
    end

    it "should not have a custom title" do
      visit talks_path
      page.should_not have_selector('title', :text => 'Talks')
    end

    it "should have 'talks' as page ID" do
      visit talks_path
      page.should have_selector('body#talks')
    end

  end
end
