class CreateReturnBatchItems < ActiveRecord::Migration
  def change
    create_table :return_batch_items do |t|
      t.integer :return_batch_id
      t.integer :product_ref_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
