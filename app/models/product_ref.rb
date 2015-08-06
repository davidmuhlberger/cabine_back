# == Schema Information
#
# Table name: product_refs
#
#  id                           :integer          not null, primary key
#  product_id                   :integer
#  size                         :string
#  sku_name                     :string
#  inventory_quantity_cabine    :integer
#  inventory_type               :string
#  inventory_brand_availability :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class ProductRef < ActiveRecord::Base
  belongs_to :product
  has_many :supply_batch_items
  validates :product_id, presence: true
  validates :size, presence: true
  validates :sku_name, presence: true
  validates :inventory_quantity_cabine, presence: true
  validates :inventory_type, presence: true
  validates :inventory_brand_availability, presence: true
end
