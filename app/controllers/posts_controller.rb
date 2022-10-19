class PostsController < ApplicationController
  
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_path
    else
      render new_post_path(@item)
    end
  end

  private
  def post_params
    params.require(:post).permit(:image, :text).merge(user_id: current_user.id)
  end
end
