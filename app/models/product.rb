# == Schema Information
#
# Table name: products
#
#  id                   :integer          not null, primary key
#  gender               :string
#  name                 :string
#  availability         :string
#  purchase_price_ht    :string
#  gross_sell_price_ht  :string
#  vat_rate             :string
#  promotion_percentage :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  brand_id             :integer
#  category             :string
#

class Product < ActiveRecord::Base
  belongs_to :brand
  has_many :product_refs
  validates :brand_id, presence: true
  validates :category, presence: true
  validates :gender, presence: true
  validates :name, presence: true
  validates :availability, presence: true
  validates :purchase_price_ht, presence: true, numericality: true, :numericality => {:greater_than_or_equal_to => 0}
  validates :gross_sell_price_ht, presence: true, numericality: true, :numericality => {:greater_than_or_equal_to => 0}
  validates :vat_rate, presence: true, numericality: true, :numericality => {:greater_than_or_equal_to => 0, :less_than => 1}
  validates :promotion_percentage, presence: true, numericality: true, :numericality => {:greater_than_or_equal_to => 0, :less_than => 1}
end
