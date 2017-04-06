class RemoveStateFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :state, :string
  end
end
