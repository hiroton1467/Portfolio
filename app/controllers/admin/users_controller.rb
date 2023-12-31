class Admin::UsersController < ApplicationController


    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
      @continues = @user.continues
    end

    def edit
      @user = User.find(params[:id])
    end

    def favorite
      @user = User.find(params[:id])
      @likes= Like.where(user_id: @user.id).pluck(:continue_id)
      #@likes = @user.likes.pluck(:continue_id)
      @favorite_continues = Continue.find(@likes)
    end

    def update
        @user = User.find(params[:id])
     if @user.update(user_params)
        flash[:notice] = "successfully updated."
        redirect_to admin_user_path
     else
        render :edit
     end
    end

    def leave
      @user = User.find(params[:id])
    end

    def withdrawal
     @user = User.find(params[:id])
     @user.update(is_deleted: true)
     flash[:notice] = "退会処理を実行しました"
     redirect_to admin_users_path
    end

    private

    def user_params
     params.require(:user).permit(:name, :email, :password, :profile_image)
    end
end
