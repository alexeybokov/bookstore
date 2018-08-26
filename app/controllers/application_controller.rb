class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_order
  helper_method :current_order
  delegate :current_order, to: :current_user

  private

  def set_order
    @order = Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    @order = Order.create
    session[:order_id] = @order.id
  end
end
