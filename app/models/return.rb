# == Schema Information
#
# Table name: returns
#
#  id            :integer          not null, primary key
#  brand_id      :integer
#  expected_date :date
#  status        :string
#  send_date     :date
#  comment       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Return < ActiveRecord::Base
  belongs_to :brand
  has_many :return_batches
  validates :expected_date, presence: true
end
