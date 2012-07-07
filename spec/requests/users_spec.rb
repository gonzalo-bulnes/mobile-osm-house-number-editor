require 'spec_helper'

describe "Users" do

  subject { page }

  describe "sign up page" do

    before { visit new_user_registration_path }

    let(:sign_up) { "Sign up" }

    it "should have basic structure" do
      should have_selector('header')
      should have_selector('nav')
      should have_selector('div#main')
      should have_selector('footer')
    end

    it "should have CSS basic identifiers" do
      should have_selector('#header-wrapper')
      should have_selector('#content-wrapper')
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

    it "should have a form to create Users" do
      should have_selector('form')
    end

    describe "with valid information" do
      before do
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "applepie"
        fill_in "Password confirmation", with: "applepie"
      end

      it "should create an user" do
        expect { click_button sign_up }.to change(User, :count).by(1)
      end
    end
  end

  describe "sign in page" do

    before { visit new_user_session_path }

    it "should have basic structure" do
      should have_selector('header')
      should have_selector('nav')
      should have_selector('div#main')
      should have_selector('footer')
    end

    it "should have CSS basic identifiers" do
      should have_selector('#header-wrapper')
      should have_selector('#content-wrapper')
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

    it "should have a form to authenticate Users" do
      should have_selector('form')
    end
  end

  describe "'show' page" do

    let(:user) { FactoryGirl.create(:user) }
    let!(:house_number_1) { FactoryGirl.create(:house_number, user: user, changeset: 1234, latitude: -32.12345, longitude: -70.98765, value: "110") }
    let!(:house_number_2) { FactoryGirl.create(:house_number, user: user, changeset: 1223, latitude: -33.23456, longitude: -70.99832, value: "202") }

    before { visit user_path(user) }

    it "should have basic structure" do
      should have_selector('header')
      should have_selector('nav')
      should have_selector('div#main')
      should have_selector('footer')
    end

    it "should have CSS basic identifiers" do
      should have_selector('#header-wrapper')
      should have_selector('#content-wrapper')
    end

    it { should have_selector('title', :text => 'OpenStreetMap House Number Editor') }
    it { should have_selector('h1', :text => 'OpenStreetMap House Number Editor') }

    it "should have copyright notice and sources link" do
      should have_selector('footer p.copyright', :text => 'Copyright')
      should have_selector('footer p a', :text => 'Github repository')
    end

    describe "house numbers" do
      it { should have_content(house_number_1.value) }
      it { should have_content(house_number_1.latitude) }
      it { should have_content(house_number_1.longitude) }

      it { should have_content(house_number_2.value) }
      it { should have_content(house_number_2.latitude) }
      it { should have_content(house_number_2.longitude) }

      it { should have_content(user.house_numbers.count) }
    end
  end
end
