class Room < ApplicationRecord
  has_many :users
  has_many :messages
  
  validates :room_name, presence: true
end
