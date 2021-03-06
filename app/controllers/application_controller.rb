class ApplicationController < ActionController::Base
  helper_method :current_order
  helper_method :current_or_guest_user
  delegate :current_order, to: :current_or_guest_user

  protect_from_forgery

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        logging_in
          # reload guest_user to prevent caching problems before destruction
          guest_user(with_retry = false).try(:reload).try(:destroy)
          session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user(with_retry = true)
    # Cache the value the first time it's gotten.
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
    session[:guest_user_id] = nil
    guest_user if with_retry
  end

  private

  def logging_in
    guest_user.current_order.update(user_id: current_user.id)
    guest_user.destroy
  end

  def create_guest_user
    u = User.new(first_name: "guest", email: "guest_#{Time.now.to_i}#{rand(100)}@example.com")
    u.save!(validate: false)
    session[:guest_user_id] = u.id
    u
  end
end
