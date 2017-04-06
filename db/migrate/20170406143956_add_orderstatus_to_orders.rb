class AddOrderstatusToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :orderstatus, foreign_key: true
  end
end
