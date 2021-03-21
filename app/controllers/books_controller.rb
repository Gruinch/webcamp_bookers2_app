class BooksController < ApplicationController

  def new
  end

  def index
    @books=Book.all
    @book=Book.new
  end

  def create
    @book=Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book_new = Book.new
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
    params.require(:book).permit(:title, :body)
  end
end
