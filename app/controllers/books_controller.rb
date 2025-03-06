class BooksController < ApplicationController

  def create 
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      flash[:notice] = "Successful"
      redirect_to books_path
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Successful"
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "Failure"
      redirect_to book_path(@book.id)
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
