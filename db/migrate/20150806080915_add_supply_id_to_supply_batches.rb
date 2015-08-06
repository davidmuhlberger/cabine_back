class AddSupplyIdToSupplyBatches < ActiveRecord::Migration
  def change
    add_column :supply_batches, :supply_id, :integer
  end
end
