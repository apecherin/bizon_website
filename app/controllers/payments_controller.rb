class PaymentsController < ApplicationController
  def new
    @product = Product.find( params[:prod_id])
    respond_to do |format|
      format.html # new.html.haml
      format.json { }
    end
  end

  def create
    @user = User.find(current_user.id.to_i)
    @product = Product.find( params[:prod_id])
    if @user.save_with_payment(params.merge(:prod_price => @product.price))
      render :show
    else
      render :new
    end
  end

  def show
    @user = User.find(current_user.id.to_i)
  end
end