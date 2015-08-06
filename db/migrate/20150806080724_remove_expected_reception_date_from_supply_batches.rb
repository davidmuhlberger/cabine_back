class RemoveExpectedReceptionDateFromSupplyBatches < ActiveRecord::Migration
  def change
    remove_column :supply_batches, :expected_reception_date, :date
  end
end
