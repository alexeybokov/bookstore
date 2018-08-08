class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal :total_price, precision: 5, scale: 2
      t.datetime :completed_date
      t.string :state, default: STATE_IN_PROGRESS
      t.integer :user_id
      t.integer :credit_card_id
      t.integer :delivery_id
      t.integer :billing_address_id
      t.integer :shipping_address_id
      t.timestamps
    end
  end
end
