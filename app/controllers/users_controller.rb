class UsersController < ApplicationController


  def create
  end

  def show
    @user=User.find(params[:id])
    @book_new = Book.new
    @books = @user.books
  end

  def index
    @user=current_user
    @users=User.all
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "Profile was successfully updated!!"
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
