class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :role, :firstname, :lastname, :description, :odesk_link, :password, :password_confirmation, :remember_me, :portfolio_ids, :avatar, :avatar_cache, :remove_avatar

  validates :firstname, presence: true
  validates :lastname, presence: true

  has_many :portfolio_users
  has_many :portfolios, through: :portfolio_users
  has_many :blogs
  has_many :comments, dependent: :destroy

  def custom_label_method
    "#{self.firstname} #{self.lastname}"
  end
end
