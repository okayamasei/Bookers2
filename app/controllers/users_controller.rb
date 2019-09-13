class UsersController < ApplicationController

    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]
    # before_action :set_user, only: [:edit, :update]

    def index
        @booknew = Book.new
        @users= User.all
        @user = current_user
    end

	def show
        @user = User.find(params[:id])
        @users = User.all
		@booknew = Book.new
        @books= @user.books
	end

    # def create
    #     user=User.new(user_params)
    #     if  user.save
    #         flash[:success]="successfully"
    #         redirect_to book_path(book)
    #     end
    # end

	def update
        @user = User.find(params[:id])
        if  @user.update(user_params)
            redirect_to user_path(@user)
            flash[:success]="You have updated user successfully."
        else
            flash[:notice] = "error"
            render :edit
        end
    end

    def edit
    	@user = User.find(params[:id])
    end

    private

    def correct_user
        user = User.find(params[:id])
        if current_user != user
          redirect_to user_path(current_user)
        end
    end

    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end

    # def set_user
    #     @user = User.find(params[:id])
    # end

    # def post_image_params
    #         params.require(:post_image).permit(:shop_name, :image, :introduction)
    #     end
end
