class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.integer :product_amount, null: false

      t.timestamps null: false
    end
  end
end
