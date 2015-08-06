# == Schema Information
#
# Table name: supply_batch_items
#
#  id                :integer          not null, primary key
#  supply_batch_id   :integer
#  expected_quantity :integer
#  received_quantity :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  size              :string
#  sku_name          :string
#  product_ref_id    :integer
#

class SupplyBatchItem < ActiveRecord::Base
  belongs_to :supply_batch
  belongs_to :product_ref
  validates :expected_quantity, presence: true
  validates :size, presence: true
  validates :sku_name, presence: true
end
