class OrderDecorator < ApplicationDecorator
  delegate_all

  def subtotal
    "€#{object.order_items.sum(&:subtotal)}"
  end

  # TODO: add support for coupon
  def total_with_coupon
    "€#{object.order_items.sum(&:subtotal)}"
  end
end
