class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create 
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to new_book_path
    else
      redirect_to new_book_path
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
