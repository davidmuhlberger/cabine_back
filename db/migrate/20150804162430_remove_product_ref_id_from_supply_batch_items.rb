class RemoveProductRefIdFromSupplyBatchItems < ActiveRecord::Migration
  def change
    remove_column :supply_batch_items, :product_ref_id, :integer
  end
end
