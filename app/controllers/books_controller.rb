class BooksController < ApplicationController
  # load_and_authorize_resource

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id]).decorate
  end

  def newest
    @books = Book.newest
    render action: :index
  end

  def price_asc
    @books = Book.price_asc
    render action: :index
  end

  def price_desc
    @books = Book.price_desc
    render action: :index
  end
end
