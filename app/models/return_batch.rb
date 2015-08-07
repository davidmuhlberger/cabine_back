# == Schema Information
#
# Table name: return_batches
#
#  id         :integer          not null, primary key
#  product_id :integer
#  return_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ReturnBatch < ActiveRecord::Base
  belongs_to :product
  belongs_to :return
  has_many :return_batch_items
end
