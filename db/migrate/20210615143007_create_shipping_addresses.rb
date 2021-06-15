class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.references :customer, foreign_key: true, null: false
      t.string :receiver_name, null: false
      t.string :receiver_postal_code, null: false
      t.string :receiver_address, null: false

      t.timestamps null: false
    end
  end
end
