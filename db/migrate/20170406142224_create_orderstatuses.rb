class CreateOrderstatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :orderstatuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
