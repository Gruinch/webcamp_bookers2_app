class UsersController < ApplicationController
  
  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def show
    @user=User.find(params[:id])
    @books=@user.books.page(params[:page]).reverse_order
    @book=Book.new
  end
  
  def index
    @user=User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @use=User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def book_params
    params.require(:book).permit(:title, :body, :user_id).merge(user_id:current_user.id)
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  
end
