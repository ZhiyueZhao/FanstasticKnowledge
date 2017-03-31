class CreateProvinces < ActiveRecord::Migration[5.0]
  def change
    create_table :provinces do |t|
      t.string :name
      t.decimal :GST
      t.decimal :PST
      t.decimal :HST

      t.timestamps
    end
  end
end
