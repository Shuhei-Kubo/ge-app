class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  validates :text, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
