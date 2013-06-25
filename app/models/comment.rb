class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :blog_id
  validates :content, presence: true
  validates :user_id, presence: true
  validates :blog_id, presence: true
  belongs_to :user, :foreign_key => :user_id
  belongs_to :blog, :foreign_key => :blog_id
  default_scope order: 'comments.created_at DESC'
end
