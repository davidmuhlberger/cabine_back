class AddVatRateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :vat_rate, :decimal
  end
end
