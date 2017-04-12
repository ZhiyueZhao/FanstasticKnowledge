class OrdersController < ApplicationController
  def show
    @orders = current_user.orders.where("orderstatus_id>1")
  end

  def details
    @order = Order.find(params[:id])
  end
end
