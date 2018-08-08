class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    flash[:notice] = "#{@book.title} was created!" if @book.save
    respond_with @book
  end

  def update
    flash[:notice] = "#{@book.title} was updated!" if @book.update(book_params)
    respond_with @book
  end

  def destroy
    @book.destroy
    redirect_to action: 'index', alert: "#{@book.title} was deleted!"
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :price, :in_stock)
  end
end
