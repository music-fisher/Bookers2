class PostCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    #comment = Post_comments.new(post_comment_params)
    #comment.user_id = current_user.id
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.book_id = @book.id
    @comment.save
    @comment = PostComment.new
    @user = @book.user

  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = current_user.post_comments
    PostComment.find(params[:id]).destroy
    @user = @book.user
    # PostComment.find_by(id: params[:id],book_id: params[:book_id]).destroy
    # redirect_to book_path(params[:book_id])
    @comment = PostComment.new
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
