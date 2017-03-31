class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.string :product_video
      t.decimal :pur_in_price
      t.integer :quantity_in_stock
      t.decimal :sell_price
      t.references :type, foreign_key: true
      t.references :status, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
