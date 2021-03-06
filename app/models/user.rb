class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 20 }
  validates :introduction, length: { minimum: 1, maximum: 50 }

  has_many :books,dependent: :destroy
  attachment :profile_image

   def email_required?
    false
  end

  def email_changed?
    false
  end
end
