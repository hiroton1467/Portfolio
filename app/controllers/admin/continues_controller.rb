class Admin::ContinuesController < ApplicationController
  
  def index
    @continues = Continue.all
    @user = current_user
  end

  def show
    @continue = Continue.find(params[:id])
    @user = @continue.user
  end

  def favorite
    @continue.likes = Continue.like.where(user_id: @user.id).pluck(:post_id)
    @like_continues = Continue.find(likes)
  end

  def search
    @continues = Continue.looks(params[:search], params[:word])
  end


  def edit
  end

  
  def destroy
    @continue = Continue.find(params[:id])
    @continue.destroy
    redirect_to user_path(current_user.id)
  end

  
  private
  def continue_params
    params.require(:continue).permit(:title, :post, :start_at, :end_at, :period)
  end

end