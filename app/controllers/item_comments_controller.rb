class ItemCommentsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @item_comment = ItemComment.new(item_comment_params)
    if @item_comment.save
      redirect_to item_path(params[:item_id])
    end
  end

  private
  def item_comment_params
    params.require(:item_comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
