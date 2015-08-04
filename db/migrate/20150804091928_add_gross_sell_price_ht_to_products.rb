class AddGrossSellPriceHtToProducts < ActiveRecord::Migration
  def change
    add_column :products, :gross_sell_price_ht, :decimal
  end
end
