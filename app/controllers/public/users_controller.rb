class Public::UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @continues = @user.continues
    end

    def edit
        user = User.find(params[:id])
        unless user.id == current_user.id
         redirect_to root_path
        end
        @user = User.find(params[:id])
    end

    def favorite
      @user = User.find(params[:id])
      @likes= Like.where(user_id: @user.id).pluck(:continue_id)
      #@likes = @user.likes.pluck(:continue_id)
      @favorite_continues = Continue.find(@likes)
    end

    def update
    user = User.find(params[:id])
     unless user.id == current_user.id
      redirect_to post_images_path
     end
        @user = User.find(current_user.id)
     if @user.update(user_params)
        flash[:notice] = "successfully updated."
        redirect_to user_path(@user.id)
     else
        render :edit
     end
    end

    def withdrawal
     @user = User.find(params[:id])
     @user.update(is_deleted: true)
     reset_session
     flash[:notice] = "退会処理を実行しました"
     redirect_to new_user_registration_path
    end

    private

    def user_params
     params.require(:user).permit(:name, :email, :password, :profile_image)
    end
end
