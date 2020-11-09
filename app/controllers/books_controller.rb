class BooksController < ApplicationController
  # before_action :move_to_signed_in
    before_action :authenticate_user! 
    before_action :correct_user, only: [:edit, :update]
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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
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
  
  def correct_user
    book = Book.find(params[:id])
    if current_user != book.user
      redirect_to books_path
    end
  end

  # def move_to_signed_in
  #   unless user_signed_in?
  #     #サインインしていないユーザーはログインページが表示される
  #     redirect_to  '/users/sign_in'
  #   end
  # end

end
