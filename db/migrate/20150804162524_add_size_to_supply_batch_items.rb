class AddSizeToSupplyBatchItems < ActiveRecord::Migration
  def change
    add_column :supply_batch_items, :size, :string
  end
end
