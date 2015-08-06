class RemoveReceptionDateFromSupplyBatches < ActiveRecord::Migration
  def change
    remove_column :supply_batches, :reception_date, :date
  end
end
