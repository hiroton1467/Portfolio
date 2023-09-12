class Public::ContinuesController < ApplicationController

  def index
    @continues = Continue.all
    @user = current_user
  end

  def new
    @continue = Continue.new
  end

  def show
    @continue = Continue.find(params[:id])
    @user = @continue.user
    @comment = Comment.new
  end

  def favorite
    @continue.likes = Continue.like.where(user_id: @user.id).pluck(:post_id)
    @like_continues = Continue.find(likes)
  end

  def search
    @continues = Continue.looks(params[:search], params[:word])
  end

  def f_detail
  end

  def edit
  end

  def update
  end

  def destroy
    @continue = Continue.find(params[:id])
    @continue.destroy
    redirect_to user_path(current_user.id)
  end

  def create
     @continue = Continue.new(continue_params)
     @continue.user_id = current_user.id
   if @continue.save
     flash[:notice] = "投稿に成功しました"
    redirect_to continue_path(@continue.id)
   else
     render :new
   end
  end

  private
  def continue_params
    params.require(:continue).permit(:title, :post, :start_at, :end_at, :period)
  end

end
