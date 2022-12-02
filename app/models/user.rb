class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :avatar
  has_many :posts
  has_many :items
  has_many :purchases
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

  with_options presence: true do
    validates :nickname
    validates :name
  end
end
