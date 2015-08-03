class CreateProductRefs < ActiveRecord::Migration
  def change
    create_table :product_refs do |t|
      t.integer :product_id
      t.string :size
      t.string :sku_name
      t.integer :inventory_quantity_cabine
      t.string :inventory_type
      t.string :inventory_brand_availability

      t.timestamps null: false
    end
  end
end
