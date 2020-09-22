module ApplicationHelper
  def current_order_items_count
    current_order.order_items.count
  end
end
