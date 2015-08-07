class AddSkuNameToReturnBatchItem < ActiveRecord::Migration
  def change
    add_column :return_batch_items, :sku_name, :string
  end
end
