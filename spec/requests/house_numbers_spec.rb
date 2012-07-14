require 'spec_helper'

describe "House Number pages" do

  subject { page }

  pending "new" do
    # reason: user registration has not been implemented yet
    before { visit new_house_number_path }

    let(:submit) { "Submit!" }

    describe "with invalid information" do
      it "should not create an house number" do
        pending "This test should be performed with a signed-in user"
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
        pending "This test should be performed with a signed-in user"
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
        pending "This test should be performed with a signed-in user"
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
        pending "This test should be performed with a signed-in user"
        should have_selector('#flash .flash-success', text: "Success!")
      end
    end
  end
end
