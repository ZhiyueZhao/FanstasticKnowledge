class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birthdate
      t.datetime :deathdate
      t.text :biography

      t.timestamps
    end
  end
end
