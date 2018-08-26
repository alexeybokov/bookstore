class OrderItem < ApplicationRecord
  include AASM

  belongs_to :book
  belongs_to :order
  validates :quantity, presence: true

  aasm column: :state do
    state :in_cart, initial: true
    state :in_order

    event :in_order do
      transitions from: :in_cart, to: :in_order
    end
  end
end
