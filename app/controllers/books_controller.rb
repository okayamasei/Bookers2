class BooksController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_user, only: [:update, :edit]
	def edit
		@book=Book.find(params[:id])
		@books = Book.all
	end

	def create
		booknew=Book.new(book_params)
		booknew.user_id = current_user.id
		if booknew.save(book_params)
		   flash[:success]="successfully"
		   redirect_to book_path(booknew)
	    else
		    @user = current_user
			@books=Book.all
			@booknew=Book.new
			flash[:notice]="error"
		    render :index
	 	end
	end

	def update
		book = Book.find(params[:id])
		      book.user_id = current_user.id
		  if  book.update(book_params)
			flash[:success]="successfully"
			redirect_to book_path(book.id)
		else
			@book=Book.find(params[:id])
			flash[:notice]="error"
			render :edit
		end
	end

	def index
		@user = current_user
		@books=Book.all
		@users = User.all
		@booknew=Book.new
	end

	def show
		@booknew=Book.new
		@book=Book.find(params[:id])
		@user = @book.user
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end
	private

	def correct_user
	    book = Book.find(params[:id])
	    if current_user != book.user
	      redirect_to books_path
	    end
	 end
	def book_params
		params.require(:book).permit(:title,:body)
	end
end
