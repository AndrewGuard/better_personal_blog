class User < ActiveRecord::Base
  has_secure_password

  has_many :posts
  has_many :post_tags, through: :posts
  has_many :tags, through: :post_tags
  has_many :comments, through: :posts

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :username, presence: true
end
