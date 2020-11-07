class BooksController < ApplicationController
  def show
    @book = Book.new
    @book_detail = Book.find(params[:id])
    @user = @book_detail.user
    @books = @user.books
  end
  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(book.id)
    else
    @user = current_user
    @books = Book.all
    @book = book
      render :index
    end
  end
  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  private
  def  book_params
    params.require(:book).permit(:title,:body)
  end

end
