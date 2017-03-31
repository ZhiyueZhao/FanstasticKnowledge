class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.decimal :price
      t.references :order, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
