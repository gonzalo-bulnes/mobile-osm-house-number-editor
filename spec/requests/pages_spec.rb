require 'spec_helper'

describe "Pages" do

  subject { page }

  describe "Article page" do
    before { visit article_path }

    it { should have_selector('p', :text => 'Find me in /app/views/pages/article.html.haml') }
  end

  describe "Home page" do 
    before { visit home_path }

    it "should have basic structure" do
      should have_selector('header')
      should have_selector('nav')
      should have_selector('div#main')
      should have_selector('footer')
    end
    it "should have CSS basic identifiers" do
      should have_selector('#header-wrapper')
      should have_selector('#map-wrapper')
    end
    it "should have specific CSS identifiers" do
      should have_selector('#map')
      should have_selector('#form-wrapper')
      should have_selector('#form-wrapper-inner')
    end
    it { should have_selector('title', :text => 'OpenStreetMap House Number Editor') }
    it { should have_selector('h1', :text => 'OpenStreetMap House Number Editor') }
    it "should have a navigation list of links" do
      should have_selector('nav ul li a')
    end
    it "should have copyright notice and sources link" do
      should have_selector('footer p.copyright', :text => 'Copyright')
      should have_selector('footer p a', :text => 'Github repository')
    end
  end 
end
