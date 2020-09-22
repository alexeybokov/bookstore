class Coupon < ApplicationRecord
  belongs_to :order, optional: true

  validates :number, presence: true, uniqueness: true
  validates :discount, presence: true
end
