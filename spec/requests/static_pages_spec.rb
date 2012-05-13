require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "About page" do
    before { visit about_path }

    pending { should have_selector('title',
                                    text: 'Mobile OSM House Number Editor - About') }
    it { should have_selector('p', text: 'Find me in /app/views/static_pages/about.html.haml') }
  end

  describe "Home page" do
    before { visit root_path }
    it "should be a page which exists" do
      get "/"
      response.code.should eq("200")
    end
  end
end
