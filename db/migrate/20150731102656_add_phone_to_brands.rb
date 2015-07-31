class AddPhoneToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :phone, :string
  end
end
