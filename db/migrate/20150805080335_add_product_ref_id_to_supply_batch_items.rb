class AddProductRefIdToSupplyBatchItems < ActiveRecord::Migration
  def change
    add_column :supply_batch_items, :product_ref_id, :integer
  end
end
