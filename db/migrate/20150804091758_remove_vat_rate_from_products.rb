class RemoveVatRateFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :vat_rate, :float
  end
end
