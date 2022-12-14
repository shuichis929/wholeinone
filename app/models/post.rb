class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :post_image
  has_many :post_comments

  validates :text, presence: true, length: { maximum: 200 }
  validates :post_image, presence: true

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
