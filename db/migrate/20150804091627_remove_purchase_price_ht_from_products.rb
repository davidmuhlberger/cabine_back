class RemovePurchasePriceHtFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :purchase_price_ht, :float
  end
end
