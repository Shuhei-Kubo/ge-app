class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  

  validates :text, presence: true, unless: :image?

  mount_uploader :image, ImageUploader

  def like(user)
    likes.create(user_id: user.id)
  end

  
  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end
  
end
