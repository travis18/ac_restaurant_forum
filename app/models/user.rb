class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, dependent: :restrict_with_error
  has_many :restaurants, through: :comments
  has_many :favorites, dependent: :destroy
  has_many :favorite_restaurants, thorugh: :favorites, source: :restaurant
  mount_uploader :avatar, AvatarUploader

  def admin?
    return self.role == "admin"
  end

  def get_username
    if self.name != nil
      return self.name
    else
      return self.email.split("@").first
    end
  end
end
