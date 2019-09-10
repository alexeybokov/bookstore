class Coupon < ApplicationRecord
  belongs_to :order

  validates :number, presence: true, uniqueness: true
  validates :discount, presence: true
end
