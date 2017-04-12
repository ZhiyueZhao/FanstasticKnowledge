class CreateAboutUs < ActiveRecord::Migration[5.0]
  def change
    create_table :about_us do |t|
      t.text :whatwesell
      t.text :whatwewant

      t.timestamps
    end
  end
end
