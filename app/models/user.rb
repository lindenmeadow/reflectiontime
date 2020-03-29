class User < ActiveRecord::Base
  has_secure_password
  has_many :reflections
  validates :name, presence: true
  validates :name, uniqueness: true
end
