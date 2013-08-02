class Product < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  attr_accessible :id, :title, :desc, :avatar, :path, :price, :attachfree, :attachcomm
  validates :desc, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  default_scope order: 'products.created_at DESC'
  has_attached_file :attachfree
  has_attached_file :attachcomm
end
