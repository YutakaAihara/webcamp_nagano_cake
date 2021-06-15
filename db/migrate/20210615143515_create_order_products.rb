class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.references :order, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.integer :price_including_tax, null: false
      t.integer :product_amount, null: false
      t.integer :making_status, null: false, default: 0

      t.timestamps
    end
  end
end
