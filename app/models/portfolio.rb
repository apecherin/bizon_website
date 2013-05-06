class Portfolio < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  attr_accessible :description, :name, :url, :image, :image_cache, :remove_image, :user_ids

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :users, presence: true

  has_many :portfolio_users
  has_many :users, through: :portfolio_users
end