class OrdersController < ApplicationController
  load_and_authorize_resource

  def index
    @items = current_order.order_items.preload(:book).map(&:decorate)
    @decorated_order = current_order.decorate
  end

  def show
  end
end
