class PortfolioUser < ActiveRecord::Base
  belongs_to :portfolio, :foreign_key => :portfolio_id
  belongs_to :user, :foreign_key => :user_id
end
