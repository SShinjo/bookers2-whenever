class SearchsController < ApplicationController
	def search
	@book = Book.new
		case params[:model] when "User"
			case params[:option] when "完全一致"
				@users = User.where(name: params[:search])
			when "前方一致"
				@users = User.where('name LIKE ?', "#{params[:search]}%")
			when "後方一致"
				@users = User.where('name LIKE ?', "%#{params[:search]}")
			when "部分一致"
				@users = User.where('name LIKE ?', "%#{params[:search]}%")
			end

		render template: "users/index"

		when "Book"
			case params[:option] when "完全一致"
				@books = Book.where(title: params[:search])
			when "前方一致"
				@books = Book.where('title LIKE ?', "#{params[:search]}%")
			when "後方一致"
				@books = Book.where('title LIKE ?', "%#{params[:search]}")
			when "部分一致"
				@books = Book.where('title LIKE ?', "%#{params[:search]}%")
			end

		render template: "books/index"

		end
	end
end
