class RemovePromotionPercentageFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :promotion_percentage, :float
  end
end
