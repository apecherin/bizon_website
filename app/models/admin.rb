class Admin < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :role, :firstname, :lastname, :description, :odesk_link, :password, :password_confirmation, :remember_me, :portfolio_ids, :avatar, :avatar_cache, :remove_avatar
  def custom_label_method
    "#{self.firstname} #{self.lastname}"
  end

end
