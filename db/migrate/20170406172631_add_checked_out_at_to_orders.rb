class AddCheckedOutAtToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :checked_out_at, :datetime
    add_column :orders, :total_price, :decimal
  end
end
