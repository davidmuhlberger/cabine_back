class AddPurchasePriceHtToProducts < ActiveRecord::Migration
  def change
    add_column :products, :purchase_price_ht, :decimal
  end
end
