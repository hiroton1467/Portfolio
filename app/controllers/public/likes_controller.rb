class Public::LikesController < ApplicationController

  def create
    @continue = Continue.find(params[:continue_id])
    @like = current_user.likes.new(continue_id: @continue.id)
    @like.save
    redirect_to continue_path(@continue.id)
  end

  def destroy
    @continue = Continue.find(params[:continue_id])
    @like = current_user.likes.where(continue_id: @continue.id)
    @like.destroy_all
    redirect_to continue_path(@continue.id)
  end



end
