class AddPromotionPercentageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :promotion_percentage, :decimal
  end
end
