class User < ApplicationRecord

  has_secure_password
  validates :password, presence: true, confirmation: true
  validates :email, presence: true, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :profile_photo

 end
