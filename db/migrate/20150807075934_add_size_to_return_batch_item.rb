class AddSizeToReturnBatchItem < ActiveRecord::Migration
  def change
    add_column :return_batch_items, :size, :string
  end
end
