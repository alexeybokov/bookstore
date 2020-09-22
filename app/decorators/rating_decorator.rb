class RatingDecorator < ApplicationDecorator
  delegate_all

  def owner
    User.find(user_id)
  end
end
