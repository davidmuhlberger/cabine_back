class RemoveCommentFromSupplyBatches < ActiveRecord::Migration
  def change
    remove_column :supply_batches, :comment, :text
  end
end
