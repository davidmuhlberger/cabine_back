class RemoveIdBrandFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :id_brand, :integer
  end
end
