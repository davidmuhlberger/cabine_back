# == Schema Information
#
# Table name: brands
#
#  id               :integer          not null, primary key
#  name             :string
#  contact_name     :string
#  contact_function :string
#  address_street   :string
#  address_city     :string
#  address_zip      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  email            :string
#  phone            :string
#

class Brand < ActiveRecord::Base
  has_many :products
  validates :name, presence: true
  validates :contact_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
end
