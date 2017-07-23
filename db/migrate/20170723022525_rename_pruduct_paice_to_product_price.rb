class RenamePruductPaiceToProductPrice < ActiveRecord::Migration[5.0]
  def change
    rename_column :product_lists, :pruduct_paice, :product_price
  end
end
