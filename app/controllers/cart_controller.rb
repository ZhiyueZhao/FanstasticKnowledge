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
    @description = 'Description of Charge'
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
    amount = (@cart.total_price * 100).to_i # $5 in cents

    @customer = Stripe::Customer.create(email:  params[:stripeEmail],
                                       source: params[:stripeToken])

    @charge = Stripe::Charge.create(customer:    @customer.id,
                                    amount:      amount,
                                    description: 'Rails Stripe customer',
                                    currency:    'cad')

    @cart.checkout!
    session.delete(:cart_id)
    flash[:notice] = "Thank you for your purchase! We will ship it shortly!"
    redirect_to root_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to '/cart'
  end

  def update
    item = @cart.lineItems.find(params[:id])
    @st = params[:id]
    item.quantity = params[:line_item][@st]==nil ? 99 : params[:line_item][@st]#added this line here
    item.save
    @cart.recalculate_price!
    flash[:notice] = "Item updated!"
    redirect_to '/cart'
  end

  protected

  def find_cart
    @cart = session[:cart_id] ? Order.find(session[:cart_id]) : current_user.orders.build
  end
end
