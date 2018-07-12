class CommentsController < ApplicationController
  def create
    @comment = Comment.new
    @comment.db_id = params[:db_id]
    @comment.content = params[:comment]
    @comment.user_id = current_user.id
    @comment.save
    
    redirect_to "/"
  end

  def delete
    comment = Comment.find(params[:comment_id])
    comment.destroy
    
    redirect_to "/"
  end
end
