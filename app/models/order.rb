class Order < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :credit_card, optional: true
  belongs_to :delivery, optional: true
  belongs_to :billing_address, optional: true
  belongs_to :shipping_address, optional: true
  has_many :order_items

  def add_book(book_params)
    current_item = order_items.find_by(book_id: book_params[:book_id])

    if current_item
      current_item.quantity += book_params[:quantity].to_i
      current_item.save
    else
      order_items.create(
        book_id: book_params[:book_id],
        quantity: book_params[:quantity]
      )
    end
  end

  aasm column: :state do
    state :cart, initial: true
    state :in_delivery, after_enter: :send_confirmation
    state :delivered

    event :deliver do
      transitions from: :cart, to: :in_delivery
    end

    event :confirm do
      transitions from: :in_delivery, to: :delivered
    end
  end

  def total_price
  end
end
