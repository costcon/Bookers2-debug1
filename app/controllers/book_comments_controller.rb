class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  # before_action :correct_book_comment,only: [:destroy]

  def create
    @book = Book.find(params[:book_id])
    @book_comment = current_user.book_comments.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comments = BookComment.all
    @user = current_user
    if @book_comment.save
      redirect_to book_path(@book), notice: "You have posted comment successfully."
    else
      @book_new = Book.new
      render "books/show"
    end
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to book_path(params[:book_id])
    # @book = Book.find(params[:id])
    # @book_comment = BookComment.find(params[:id])
    # @book_comment.destroy
    # redirect_to book_path(@book)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end


end
