class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.string :name
      t.decimal :des_percentage

      t.timestamps
    end
  end
end
