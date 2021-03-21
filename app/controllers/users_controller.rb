class UsersController < ApplicationController
  
  
  def show
    @user=User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @book=Book.new

  end
  
  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path(@book)
  end
  
  def index
    @user=User.all
  end 


  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  
end
