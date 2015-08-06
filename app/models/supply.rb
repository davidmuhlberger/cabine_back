# == Schema Information
#
# Table name: supplies
#
#  id                      :integer          not null, primary key
#  brand_id                :integer
#  order_date              :date
#  expected_reception_date :date
#  status                  :string
#  reception_date          :date
#  comment                 :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Supply < ActiveRecord::Base
  belongs_to :brand
  has_many :supply_batches
  validates :order_date, presence: true
  validates :expected_reception_date, presence: true
end
