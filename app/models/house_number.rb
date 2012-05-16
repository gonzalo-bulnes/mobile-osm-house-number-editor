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

class HouseNumber < ActiveRecord::Base
  attr_accessible :changeset, :latitude, :longitude, :value

  validates :changeset, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :value, presence: true
end
