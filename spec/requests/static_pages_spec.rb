require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "About page" do
    before { visit about_path }

    it { should have_selector('p', text: 'Find me in /app/views/static_pages/about.html.haml') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('body.static_pages#help_page') }
  end

  describe "Home page" do
    before { visit root_path }
    it "should be a page which exists" do
      get "/"
      response.code.should eq("200")
    end
  end

  describe "Sign-in page" do
    before { visit signin_path }

    it { should have_selector('body.static_pages#signin_page') }

    it "should have a 'Sign in with OSM' link" do
      should have_selector('#content-wrapper a[href="/auth/osm"]')
    end
  end
end
