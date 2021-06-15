class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :genre, foreign_key: true
      t.string :product_name, null: false
      t.string :product_image_id, null: false
      t.string :product_introduction, null: false
      t.integer :pure_price, null: false
      t.boolean :now_om_sale, null: false, default: true

      t.timestamps null: false
    end
  end
end
