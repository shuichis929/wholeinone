class Room < ApplicationRecord
  has_many :users
  has_many :messages

  validates :room_name, presence: true

  def self.search(search)
    if search != ""
      Room.where('text LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end
end
