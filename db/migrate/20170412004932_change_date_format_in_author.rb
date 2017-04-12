class ChangeDateFormatInAuthor < ActiveRecord::Migration[5.0]
  def change
    change_column :authors, :birthdate, :date
    change_column :authors, :deathdate, :date
  end
end
