require 'spec_helper'

describe "Authentication" do
  describe "authorization" do
    describe "for non-signed-in users" do
      let(:user) { FactroyGirl.create(:user) }

      describe "in the house numbers controller" do

        describe "submitting to the create action" do
          before { post house_numbers_path }
          specify { response.should redirect_to(new_user_session_path) }
        end

        describe "submitting to the destroy action" do
          before { delete house_number_path(FactoryGirl.create(:house_number)) }
          specify { response.should redirect_to(new_user_session_path) }
        end

      end
    end
  end
end
