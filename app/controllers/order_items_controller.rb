class OrderItemsController < ApplicationController
  # before_action :set_order, only: [:create, :destroy]
  # before_action :set_order_item, only: [:destroy]

  def create
    current_order.add_book(order_item_params)
    redirect_to root_path
  end

  def destroy
    current_order.order_items.find_by(id: params[:id])&.destroy
    redirect_to orders_path
  end

  private

  def order_item_params
    params.require(:order_item).permit(:book_id, :order_id, :quantity)
  end
end
