class BookCommentsController < ApplicationController

	protect_from_forgery except: :create

	def create
		@book = Book.find(params[:book_id])
		@new = BookComment.new
		@comment = current_user.book_comments.new(book_id: params[:book_id], comment: params[:comment])
		@comments = BookComment.all
		@comment.save
	end

	def destroy
		@comment = BookComment.find_by(id: params[:id])
		@book = Book.find_by(id: @comment.book_id)
		@comments = BookComment.all
		@comment.destroy
	end

	private
		def comment_params
			params.require(:book_comment).permit(:user_id, :book_id, :comment)
		end
end
