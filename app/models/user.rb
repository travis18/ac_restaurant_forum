class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments

  def admin?
    return self.role == "admin"
  end

  def email_account
     return self.email.split("@").first
  end
end
