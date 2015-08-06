class CreateSupplyBatchItems < ActiveRecord::Migration
  def change
    create_table :supply_batch_items do |t|
      t.integer :supply_batch_id
      t.integer :product_ref_id
      t.integer :expected_quantity
      t.integer :received_quantity

      t.timestamps null: false
    end
  end
end
