class AddWhorwToAboutU < ActiveRecord::Migration[5.0]
  def change
    add_column :about_us, :whorwe, :text
  end
end
