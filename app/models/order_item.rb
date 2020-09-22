class OrderItem < ApplicationRecord
  include AASM

  belongs_to :book
  belongs_to :order

  validates :quantity, presence: true
  validates :book, presence: true
  validates :order, presence: true

  def subtotal
    book.price * quantity
  end
end
