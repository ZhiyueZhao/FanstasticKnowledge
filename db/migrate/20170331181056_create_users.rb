class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :address
      t.string :post_code
      t.string :phone_number
      t.string :email
      t.string :user_name
      t.string :password
      t.references :province, foreign_key: true

      t.timestamps
    end
  end
end
