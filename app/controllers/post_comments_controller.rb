class PostCommentsController < ApplicationController
  def create
    @post_comment = PostComment.new(post_comment_params)
    if @post_comment.save
      redirect_to post_path(params[:post_id])
    end
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
