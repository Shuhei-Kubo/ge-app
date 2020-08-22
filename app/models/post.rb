class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  

  validates :text, presence: true, unless: :image?

  mount_uploader :image, ImageUploader


  
end
