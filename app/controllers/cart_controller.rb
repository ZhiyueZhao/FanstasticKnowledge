class CartController < ApplicationController

  before_action :authenticate_user!
  before_filter :find_cart

  def add
    @cart.save if @cart.new_record?
    session[:cart_id] = @cart.id
    book = Book.find(params[:id])
    LineItem.create! :order => @cart, :book => book, :price => book.sell_price, :quantity => 1
    @cart.recalculate_price!
    flash[:notice] = "Item added to cart!"
    redirect_to '/cart'
  end

  def remove
    item = @cart.lineItems.find(params[:id])
    item.destroy
    @cart.recalculate_price!
    flash[:notice] = "Item removed from cart"
    redirect_to '/cart'
  end

  def checkout
    @cart.checkout!
    session.delete(:cart_id)
    flash[:notice] = "Thank you for your purchase! We will ship it shortly!"
    redirect_to root_path
  end

  protected

  def find_cart
    @cart = session[:cart_id] ? Order.find(session[:cart_id]) : current_user.orders.build
  end
end
