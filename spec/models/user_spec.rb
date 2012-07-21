require 'spec_helper'

describe User do

  describe "factory" do

    #let(:user) { FactoryGirl.create(:signed_in_user) }

    it "should not rely on a workaround for OnmiAuth testing" do
      pending "Don't know how to test user.name not to be equal to 'Workaround Name' (see details in test comments)."
      # User is created by with the User.create_with_omniauth method
      # yet FactoryGirl only uses User.create as FactoryGirl.create(:user).
      #user.name.should be_equal("Workaround Name")
    end
  end

  before { @user = User.new }

  subject { @user }

  it { should be_valid }

  describe "house numbers associations" do
    before { @user.save }
    let!(:older_house_number) do
      FactoryGirl.create(:house_number, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_house_number) do
      FactoryGirl.create(:house_number, user: @user, created_at: 1.hour.ago)
    end

    it "should have the right house numbers in the right order" do
      @user.house_numbers.should == [newer_house_number, older_house_number]
    end

    it "should associate the related house numbers with the Anonymous user (user_id == 2) when destroyed" do
      pending "This feature is not yet implemented"
      house_numbers = @user.house_numbers
      @user.destroy
      house_numbers.each do |house_number|
        house_number.user_id.should == 2 # Anonymous user ID is 2 by convention
      end
    end

    it "should destroy associated house numbers when it is destroyed" do
      house_numbers = @user.house_numbers
      @user.destroy
      house_numbers.each do |house_number|
        lambda do
          HouseNumber.find(house_number.id)
        end.should raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  name       :string(255)
#  provider   :string(255)
#  uid        :string(255)
#

