require 'spec_helper'

describe "Pages" do

  subject { page }

  describe "Article page" do
    before { visit article_path }

    it { should have_selector('p', :text => 'Find me in /app/views/pages/article.html.haml') }
  end

  describe "Home page" do 
    before { visit root_path }

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
    it "should have a map" do
      should have_selector('#map')
    end
    it "should have a form to create HouseNumbers" do
      should have_selector('form')
    end
    it { should have_selector('div#qr-wrapper') }
    it "should not load images which won't be displayed on mobile devices" do
      should_not have_selector('#qr-wrapper img')
    end
    it "should not have invalid HTML5 input tags" do
      # No size attribute should be used if input type is 'hidden'
      # See http://dev.w3.org/html5/spec/the-input-element.html
      should_not have_selector('input[type="hidden"][size]')
    end
    it "should not have a temporary default changeset value" do
      pending "Changesets are not implemented yet, having a default value allows to submit the form even if changest is an hidden input."
      should_not have_selector('input[type="hidden"][value="default_changeset"]')
    end
    it "should reflect the rails environment" do
      # How can I simulate RAILS_ENV=qastaging ?
      should have_selector('body.demo') unless Rails.env.production?
    end
    it "should have apple-touch-icon-precomposed" do
      should have_selector('link[rel="apple-touch-icon-precomposed"][sizes="144x144"]')
      should have_selector('link[rel="apple-touch-icon-precomposed"][sizes="114x114"]')
      should have_selector('link[rel="apple-touch-icon-precomposed"][sizes="72x72"]')
      should have_selector('link[rel="apple-touch-icon-precomposed"]')
    end
    it "should have apple-touch-icons" do
      pending "Standard icons are replaced by precomposed icons."
      should have_selector('link[rel="apple-touch-icon"][sizes="144x144"]')
      should have_selector('link[rel="apple-touch-icon"][sizes="114x114"]')
      should have_selector('link[rel="apple-touch-icon"][sizes="72x72"]')
      should have_selector('link[rel="apple-touch-icon"]')
    end
    it "should have apple-touch-icon-precomposed for Android devices" do
      should have_selector('link[rel="apple-touch-icon-precomposed"]')
    end
    it "should be apple-mobile-web-app-capable" do
      should have_selector('meta[name="apple-mobile-web-app-capable"][content="yes"]')
    end
  end
end
