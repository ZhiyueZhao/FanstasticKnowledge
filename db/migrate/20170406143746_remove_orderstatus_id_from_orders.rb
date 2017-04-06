class RemoveOrderstatusIdFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :orderstatus_id, :integer
  end
end
