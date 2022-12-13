class PostCommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  
  def create
    @post_comment = PostComment.new(post_comment_params)
    @post_comment.save
    if @post_comment.save
      redirect_to post_path(params[:post_id])
    end
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
