class Public::CommentsController < ApplicationController

  def new
  end

  def create
    @continue = Continue.find(params[:continue_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.continue_id = @continue.id
    @comment.save
    redirect_to continue_path(@continue.id)
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to continue_path(params[:continue_id])
  end

   private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :continue_id)
  end


end
