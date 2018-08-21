class ApplicationController < ActionController::Base
  helper_method :current_order
  delegate :current_order, to: :current_user
end
