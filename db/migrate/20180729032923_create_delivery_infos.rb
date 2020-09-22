class CreateDeliveryInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_infos do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :street_1, null: false
      t.string :street_2
      t.string :city, null: false
      t.string :region, null: false
      t.string :country, null: false
      t.string :zip_code, null: false
      t.string :phone, null: false
      t.references :user

      t.timestamps
    end
  end
end
