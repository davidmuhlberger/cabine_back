class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.string :contact_name
      t.string :contact_function
      t.string :address_street
      t.string :address_city
      t.string :address_zip

      t.timestamps null: false
    end
  end
end
