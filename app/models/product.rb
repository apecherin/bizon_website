class Product < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  attr_accessible :id, :title, :desc, :avatar, :path, :price
  validates :desc, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  default_scope order: 'products.created_at DESC'
end
