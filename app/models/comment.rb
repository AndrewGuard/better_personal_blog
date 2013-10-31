class Comment < ActiveRecord::Base
  belongs_to :post

  validates :comment_text, presence: true
end
