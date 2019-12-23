class BookCommentsController < ApplicationController

	def create
		@book = Book.find(params[:book_comment][:book_id])
		@comment = BookComment.new(book_id: @book.id)
		@comment.comment = params[:book_comment][:comment]
		@comment.user_id = current_user.id
		@comment.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@comment = BookComment.find(params[:id])
		@comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private
		def comment_params
			params.require(:book_comment).permit(:user_id, :book_id, :comment)
		end
end
