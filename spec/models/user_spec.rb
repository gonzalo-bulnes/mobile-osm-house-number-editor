require 'spec_helper'

describe User do
  before { @user = User.new(email: "user@example.com", password: "watermelon", password_confirmation: "watermelon") }

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:house_numbers) }

  it { should be_valid }

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
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
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#

