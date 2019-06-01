class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 },
             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  before_validation { email.downcase! }
  
  validates :password, presence: true, length: { minimum: 4 }
  has_secure_password

  has_many :tasks, dependent: :destroy
end
