require 'spec_helper'

describe SessionsController do

  describe "with insufficient permissions" do
    it "should not create a session" do
      pending "Test is not implemented. (It should be.)"
    end

    describe "if 'modify the map' is not granted" do
      it "should explain why that permission is necessary" do
        pending "Test is not implemented. (It should be.)"
      end
    end

    describe "if 'read user's preferencies' is not granted" do
      it "should explain why that permission is necessary" do
        pending "Test is not implemented. (It should be.)"
      end
    end
  end

  describe "with un-valid OmniAuth data" do
    describe "with an unknowm 'provider'" do
      it "should not create a session" do
        pending "Test is not implemented. (It should be.)"
      end
    end
  end

  describe "when user OSM profile is uncomplete" do
    describe "with 'display name' empty" do
      it "should have a 'Profile' link" do
        pending "Test is not implemented. (It should be.)"
      end
    end
  end

end
