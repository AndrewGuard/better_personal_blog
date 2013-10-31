class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :comments

  validates :post_title, presence: true
  validates :post_text, presence: true
end
