class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
  mount_uploader :profile_image, ImageUploader



  validates :nickname, presence: true, uniqueness: true
  validates :profile_text, length: { maximum: 200 }

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
 

  
end
