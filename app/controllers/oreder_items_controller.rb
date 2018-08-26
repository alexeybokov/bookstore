class OrderItemsController < ApplicationController
  before_action :set_order, only: [:create, :destroy]
  before_action :set_order_item, only: [:destroy]

  def create
    @order.add_book(params)

    if @order.save
      redirect_to orders_path
    else
      flash[:error] = 'There was a problem adding this book to your cart.'
      redirect_to @book
    end
  end

  def destroy
    @order_items.destroy
    redirect_to orders_path
  end

  private

  def set_order_item
    @order_items = OrderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:book_id, :order_id, :quantity)
  end
end
