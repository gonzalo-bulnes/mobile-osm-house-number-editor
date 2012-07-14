class User < ActiveRecord::Base
  has_many :house_numbers, dependent: :destroy
end
# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

