class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :restaurants, through: :comments
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
