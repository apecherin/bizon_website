class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :role, :firstname, :lastname, :description, :odesk_link, :password, :password_confirmation, :remember_me, :portfolio_ids, :avatar, :avatar_cache, :remove_avatar, :customer

  validates :firstname, presence: true
  validates :lastname, presence: true

  has_many :portfolio_users
  has_many :portfolios, through: :portfolio_users
  has_many :blogs
  has_many :comments, dependent: :destroy

  def custom_label_method
    "#{self.firstname} #{self.lastname}"
  end

  def save_with_payment_s(params)
    logger.debug("My object: #{params}")
    if valid?
      token = params[:stripeToken]
      price = params[:prod_price]
      customer = Stripe::Customer.create(
          :card => token,
          :description => "payment from bizzon app"
      )

      Stripe::Charge.create(
          :amount => price.to_i * 100, # in cents
          :currency => "usd",
          :customer => customer.id
      )
      # Later...
      #customer_id = get_stripe_customer_id(user)
      #Stripe::Charge.create(
      #    :amount   => 1500, # $15.00 this time
      #    :currency => "usd",
      #    :customer => customer_id
      #)
      self.customer = customer.id
      save!
      return true
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end
end
