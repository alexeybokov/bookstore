class CartController < ApplicationController
  load_and_authorize_resource only: :index

  def index
  end

  def update
  end

  def destroy
  end
end
