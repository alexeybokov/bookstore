class CheckoutController < ApplicationController
  include Wicked::Wizard

  before_action :ensure_any_order_items_present

  steps :email_login, :delivery_info, :delivery, :payment, :confirm, :complete

  def show
  #  case step
  #  when :email_login then email_login
  #  when :delivery_info then delivery_info
  #  when :delivery then delivery
  #  when :payment  then payment
  #  when :confirm  then confirm
  #  when :complete then complete
  #  end
    render_wizard
  end

  # def update
  #   case step
  #   when :email_login then update_email_login
  #   when :delivery_info then update_delivery_info
  #   when :delivery then update_delivery
  #   when :payment  then update_payment
  #   when :confirm  then update_confirm
  #   when :complete then update_complete
  #   end
  #   redirect_to_valid_step
  # end

  def email_login
  end

  def delivery_info
    @delivery_info = current_user.load_delivery_info
  end

  def delivery
  end

  def payment
  end

  def confirm
  end

  def complete
  end

  def finish_wizard_path
    user_path(current_user)
  end

  private

  def ensure_any_order_items_present
   # redirect_to root_path if @items.count.zero?
  end
end
