class BooksController < ApplicationController
  def index
    @books.all
  end

  def new
    render :new
  end

  def create
    if book.save
      redirect_to books_url
    else
      flash.now[:errors] = books.full_messages
      render :new
  end

  def destroy
    book = Book.find(params[:id])
    book:destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
