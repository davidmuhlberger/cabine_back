class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.integer :brand_id
      t.date :order_date
      t.date :expected_reception_date
      t.string :status
      t.date :reception_date
      t.text :comment

      t.timestamps null: false
    end
  end
end
