require 'spec_helper'

describe "House Number pages" do

  subject { page }

  describe "new" do
    # reason: user registration has not been implemented yet

    # Rely on 'Sign in with OSM' title attribute because Capybara does not handle &nbsp;
    let(:signin) { "Sign in with OpenStreetMap" }
    let(:submit) { "Submit!" }

    describe "'Sign in with OSM' link" do
      before do
        visit signin_path
        click_on signin
      end

      it "should load the OSM authorization page" do
        pending "OmniAuth authentication is mocked up for tests, the OSM page is skipped."
        should have_content('OpenStreetMap')
        should have_content('Authorize access to your account')
      end
    end

    #let(:user) { FactoryGirl.create(:signed_in_user) }

    before do
      visit signin_path
      mock_auth_hash
      click_link signin
      visit new_house_number_path
    end

    describe "with invalid information" do
      it "should not create an house number" do
        expect { click_button submit }.not_to change(HouseNumber, :count)
      end
    end

    describe "with invalid value" do
      before do
        fill_in "House number", with: ""
        fill_in "Latitude", with: "-33.123456"
        fill_in "Longitude", with: "-70.123456"
        click_button submit
      end

      it "should display an error message" do
        should have_selector('label', text: "House number can't be blank!")
      end
    end

    describe "with valid information" do
      before do
        fill_in "House number", with: "1234"
        fill_in "Latitude", with: "-33.123456"
        fill_in "Longitude", with: "-70.123456"
      end

      it "should create an house number" do
        expect { click_button submit }.to change(HouseNumber, :count).by(1)
      end
    end

    describe "with valid information" do
      before do
        fill_in "House number", with: "1234"
        fill_in "Latitude", with: "-33.123456"
        fill_in "Longitude", with: "-70.123456"
        click_button submit
      end

      it "should flash sucess" do
        should have_selector('#flash .flash-success', text: "Success!")
      end
    end
  end
end
