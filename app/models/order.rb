class Order < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :credit_card
  belongs_to :delivery
  belongs_to :billing_address
  belongs_to :shipping_address
  has_many :order_items

  def add_book(book_params)
    current_item = order_items.find_by(book_id: book_params[:book][:book_id])

    if current_item
      current_item.quantity += book_params[:book][:quantity].to_i
      current_item.save
    else
      new_item = order_items.create(book_id: book_params[:book][:book_id],
                                    quantity: book_params[:book][:quantity],
                                    order_id: self.id)
    end
    new_item
  end

  aasm column: :state do
    state :in_progress, initial: true
    state :in_delivery, after_enter: :send_confirmation
    state :delivered

    event :deliver do
      transitions from: :in_progress, to: :in_delivery
    end

    event :confirm do
      transitions from: :in_delivery, to: :delivered
    end
  end

  def total_price
  end
end
