class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 5, scale: 2, null: false
      t.integer :in_stock
      t.integer :author_id
      t.integer :category_id
      t.timestamps
    end
  end
end
