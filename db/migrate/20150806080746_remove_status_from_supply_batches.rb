class RemoveStatusFromSupplyBatches < ActiveRecord::Migration
  def change
    remove_column :supply_batches, :status, :string
  end
end
