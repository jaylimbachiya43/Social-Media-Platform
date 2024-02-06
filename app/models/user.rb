class User < ApplicationRecord


  
  has_secure_password
  validates :password, presence: true, confirmation: true
  validates :email, presence: true, uniqueness: true
  has_many :posts
  has_many :comments
  has_many :likes

  attr_reader :username

  def initialize(username)
    @username = username
  end
 
 end
