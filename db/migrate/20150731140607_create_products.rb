class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :id_brand
      t.string :type
      t.string :gender
      t.string :name
      t.string :availability
      t.string :purchase_price_ht
      t.string :gross_sell_price_ht
      t.string :vat_rate
      t.string :promotion_percentage

      t.timestamps null: false
    end
  end
end
