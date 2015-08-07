class CreateReturnBatches < ActiveRecord::Migration
  def change
    create_table :return_batches do |t|
      t.integer :product_id
      t.integer :return_id

      t.timestamps null: false
    end
  end
end
