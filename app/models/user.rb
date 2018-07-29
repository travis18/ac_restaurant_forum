class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, dependent: :restrict_with_error
  has_many :restaurants, through: :comments
  has_many :favorites, dependent: :destroy
  has_many :favorite_restaurants, through: :favorites, source: :restaurant
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships
  # follower settings
  has_many :inverse_followships, class_name: "Followship", foreign_key: :following_id
  has_many :followers, through: :inverse_followships, source: :user
  mount_uploader :avatar, AvatarUploader

  def admin?
    return self.role == "admin"
  end

  def following?(user)
    self.followings.include?(user)
  end

  def get_username
    if self.name != nil
      return self.name
    else
      return self.email.split("@").first
    end
  end
end
