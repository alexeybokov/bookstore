class OrderItem < ApplicationRecord
  belongs_to :book
  belongs_to :order

  validates :quantity, presence: true
  validates :book, presence: true
  validates :order, presence: true
end
