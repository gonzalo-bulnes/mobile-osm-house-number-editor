# == Schema Information
#
# Table name: house_numbers
#
#  id         :integer         not null, primary key
#  changeset  :integer
#  latitude   :float
#  longitude  :float
#  value      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  user_id    :integer
#

require 'spec_helper'

describe HouseNumber do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @housenumber = user.house_numbers.build(changeset: 1234, latitude: -33.43789, longitude: -70.65049, value: "23")
  end

  subject { @housenumber }

  it { should respond_to(:changeset) }
  it { should respond_to(:latitude) }
  it { should respond_to(:longitude) }
  it { should respond_to(:value) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when changeset is not present" do
    before { @housenumber.changeset = "" }
    it { should_not be_valid }
  end

  describe "when latitude is not present" do
    before { @housenumber.latitude = "" }
    it  { should_not be_valid }
  end

  describe "when longitude is not present" do
    before { @housenumber.longitude = "" }
    it { should_not be_valid }
  end

  describe "when value is not present" do
    before { @housenumber.value = "" }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @housenumber.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow user_id access" do
      expect do
        HouseNumber.new(changeset: 1234, latitude: -33.43789, longitude: -70.65049, value: "23", user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
