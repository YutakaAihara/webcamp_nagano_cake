class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true, null: false
      t.string :receiver_name, null: false
      t.string :receiver_address, null: false
      t.string :receiver_postal_code, null: false
      t.integer :shipping, null: false
      t.integer :total_plice, null: false
      t.integer :payment_method, null: false
      t.integer :order_status, null: false

      t.timestamps null:false
    end
  end
end
