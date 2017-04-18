class AddSubTotalToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :sub_total, :decimal
    add_column :orders, :gst, :decimal
    add_column :orders, :pst, :decimal
    add_column :orders, :hst, :decimal
  end
end
