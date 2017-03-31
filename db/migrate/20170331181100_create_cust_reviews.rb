class CreateCustReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :cust_reviews do |t|
      t.text :cust_review
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
