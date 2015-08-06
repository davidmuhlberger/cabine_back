# == Schema Information
#
# Table name: supply_batches
#
#  id         :integer          not null, primary key
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  supply_id  :integer
#

class SupplyBatch < ActiveRecord::Base
  belongs_to :product
  has_many :supply_batch_items
  validates :order_date, presence: true
  validates :expected_reception_date, presence: true
end
