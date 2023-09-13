class Admin::CommentsController < ApplicationController
  
  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to admin_continue_path(params[:continue_id])
  end

   private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :continue_id)
  end
  
end
