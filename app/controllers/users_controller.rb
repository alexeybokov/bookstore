class UsersController < ApplicationController
  helper_method :current_order
  delegate :current_order, to: :current_user

  def edit
￼ end
end
