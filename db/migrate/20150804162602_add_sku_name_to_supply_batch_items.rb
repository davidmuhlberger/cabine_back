class AddSkuNameToSupplyBatchItems < ActiveRecord::Migration
  def change
    add_column :supply_batch_items, :sku_name, :string
  end
end
