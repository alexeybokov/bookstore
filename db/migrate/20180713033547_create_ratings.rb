class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.text :review
      t.integer :rating_number
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
