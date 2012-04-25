require 'spec_helper'

describe "Static pages" do

  describe "Code page" do

    it "should have the content 'StaticPages#code'" do
      visit '/code'
      page.should have_content('StaticPages#code')
    end

    it "should have 'Durion - Code' as title" do
      visit '/code'
      page.should have_selector('title', :text => 'Durion - Code')
    end
  end

  describe "Talks page" do

    it "should be the root page" do
      visit '/'
      page.should have_selector('h1', :text => 'StaticPages#talks')
    end

    it "should have the content 'StaticPages#talks'" do
      visit '/talks'
      page.should have_content('StaticPages#talks')
    end

    it "should have 'Durion - Talks' as title" do
      visit '/talks'
      page.should have_selector('title', :text => 'Durion - Talks')
    end
  end
end
