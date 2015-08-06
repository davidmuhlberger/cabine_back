class RemoveOrderDateFromSupplyBatches < ActiveRecord::Migration
  def change
    remove_column :supply_batches, :order_date, :date
  end
end
