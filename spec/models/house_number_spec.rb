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
#

require 'spec_helper'

describe HouseNumber do
  before { @housenumber = HouseNumber.new(changeset: 1234, latitude: -33.43789, longitude: -70.65049, value: "23" ) }

  subject { @housenumber }

  it { should respond_to(:changeset) }
  it { should respond_to(:latitude) }
  it { should respond_to(:longitude) }
  it { should respond_to(:value) }

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
end
