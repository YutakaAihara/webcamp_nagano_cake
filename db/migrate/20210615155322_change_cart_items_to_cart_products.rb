class ChangeCartItemsToCartProducts < ActiveRecord::Migration[5.2]
  def change
    rename_table :cart_items, :cart_products
  end
end
