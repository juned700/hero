class User < ApplicationRecord
  has_secure_password

  has_many :registrations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_events, through: :likes, source: :event

  validates :name, :email, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
    message: "is invalid" }, uniqueness: { case_sensitive: false }

  def admin?
    self.is_admin
  end
end
