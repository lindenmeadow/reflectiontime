class User < ActiveRecord::Base
  has_secure_password
  has_many :reflections
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: 4..10
  validates :password, presence: true
  validates :password, length: 4..12
end
