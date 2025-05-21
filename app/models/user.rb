class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments

  enum :role, { user: 0, moderator: 1, admin: 2 }

  before_validation :set_default_role, on: :create

  private

  def set_default_role
    self.role ||= :user
  end
end
