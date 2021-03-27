class User < ApplicationRecord
  has_secure_password
  has_one :role

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
