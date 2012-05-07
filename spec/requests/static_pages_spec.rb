require 'spec_helper'

describe "Static pages" do

  describe "Code page" do
    before { visit code_path }

    it { page.should have_content('StaticPages#code') }
    it { page.should have_selector('title', :text => 'Durion - Code') }
    it "should have basic CSS selectors" do
      page.should have_selector('body#code')
      page.should have_selector('div#page-wrapper')
    end
  end

  describe "Talks page" do
    before { visit talks_path }

    it { page.should have_selector('h1', :text => 'StaticPages#talks') }
    it { page.should have_content('StaticPages#talks') }
    it { page.should have_selector('title', :text => 'Durion') }
    it { page.should_not have_selector('title', :text => 'Talks') }
    it { page.should have_selector('body#talks') }
  end
end
