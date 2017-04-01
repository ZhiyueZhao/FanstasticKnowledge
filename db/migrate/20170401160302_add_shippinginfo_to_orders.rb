class AddShippinginfoToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :shippinginfo, :string
  end
end
