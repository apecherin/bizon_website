class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:addComment]

  def deleteComment
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :json => {}
  end

  def addComment
    status = false
    if current_user
      params[:comment][:user_id] = current_user.id.to_i
      @comment = Comment.new params[:comment]
      status = @comment.save
    end
    render :json => {success: status}
  end

end