class CreateSupplyBatches < ActiveRecord::Migration
  def change
    create_table :supply_batches do |t|
      t.integer :product_id
      t.date :order_date
      t.date :expected_reception_date
      t.string :status
      t.date :reception_date
      t.text :comment

      t.timestamps null: false
    end
  end
end
