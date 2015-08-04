class RemoveGrossSellPriceHtFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :gross_sell_price_ht, :float
  end
end
