class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :to_city
      t.string :to_address
      t.string :to_post_code
      t.decimal :shipping_fee
      t.references :user, foreign_key: true
      t.references :province, foreign_key: true

      t.timestamps
    end
  end
end
