class OrderItemsController < ApplicationController
  def create
    current_order.add_book(order_item_params)
    redirect_to root_path
    # if @order.save
    #   redirect_to orders_path
    # else
    #   flash[:error] = 'There was a problem adding this book to your cart.'
    #   redirect_to @book
    # end
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
