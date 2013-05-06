class PagesController < ApplicationController
  def index
  end

  def blog
  end

  def portfolio
    @portfolios = Portfolio.all
  end

  def getInfoPortfolio
    portfolio = Portfolio.find params[:id]
    render :json => { :portfolio => portfolio, :developers => portfolio.users }
  end

  def team
    @users = User.all
  end

  def getInfoUser
    user = User.find params[:id]
    render :json => { :user => user, :portfolios => user.portfolios }
  end
end