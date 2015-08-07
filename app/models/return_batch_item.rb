# == Schema Information
#
# Table name: return_batch_items
#
#  id              :integer          not null, primary key
#  return_batch_id :integer
#  product_ref_id  :integer
#  quantity        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  size            :string
#  sku_name        :string
#

class ReturnBatchItem < ActiveRecord::Base
  belongs_to :return_batch
  belongs_to :product_ref
  validates :quantity, presence: true
  validates :size, presence: true
  validates :sku_name, presence: true
end
