class BooksController < ApplicationController

  def new
  end

  def index
    @books=Book.all
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    @book.save
    redirect_to books_path(@book)
  end

  def show
    @book=Book.find(params[:id])
    @user=@book.user

  end

  def edit
    @book=Book.find(params[:id])
    @book.update(book_params)
    redirect_to user_path(@user.id)

  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body).merge(user_id:current_user.id)
  end
end
