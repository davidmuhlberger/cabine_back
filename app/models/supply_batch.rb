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
  belongs_to :supply
  has_many :supply_batch_items
end
