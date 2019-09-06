class BooksController < ApplicationController
  # load_and_authorize_resource

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id]).decorate
    @reviews = Rating.where(book_id: @book.id).order('created_at DESC')
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

  def name_a_to_z
    @books = Book.by_title_asc
    render action: :index
  end

  def name_z_to_a
    @books = Book.by_title_desc
    render action: :index
  end
end
