class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Successful"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "Failure"
      redirect_to user_path(@user.id)
    end
  end

  def index
    @new = Book.new
    @users = User.all
    @user = current_user
  end

  def create
    @new = Book.new(book_params)
    @new.user_id = current_user.id
    if @new.save
      flash[:notice] = "Successful"
      redirect_to book_path(@new.id)
    else
      render :index
    end
  end

    

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
