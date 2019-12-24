class User < ApplicationRecord
  has_secure_password

  validates :name, :email, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
    message: "is invalid" }, uniqueness: { case_sensitive: false }
end
