class CreateStreetAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :street_addresses do |t|
      t.string :city
      t.string :phone
      t.string :zip
      t.string :street_address

      t.timestamps
    end
  end
end
