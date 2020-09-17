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

  def self.guest
    find_or_create_by!(email: 'guest@example.com', nickname: 'guestさん', last_name_kanji: 'guest_last_name', first_name_kanji: 'guest_first_name') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
 

  
end
