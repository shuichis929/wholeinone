class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :post_image

  validates :text, presence: true
  validates :post_image, presence: true
end
