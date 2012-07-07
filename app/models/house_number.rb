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

class HouseNumber < ActiveRecord::Base
  attr_accessible :changeset, :latitude, :longitude, :value
  belongs_to :user

  default_scope order: 'house_numbers.created_at DESC'

  validates :changeset, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :value, presence: true
  validates :user_id, presence: true
end
