class ProductRef < ActiveRecord::Base
  belongs_to :product
  validates :product_id, presence: true
  validates :size, presence: true
  validates :sku_name, presence: true
  validates :inventory_quantity_cabine, presence: true
  validates :inventory_type, presence: true
  validates :inventory_brand_availability, presence: true
end
