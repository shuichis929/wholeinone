class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @post = Post.order('created_at DESC')
    @item = Item.order('created_at DESC')
    @room = Room.all
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

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path
    else
      render 'posts/edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    if current_user.id == post.user_id
      post.destroy
      redirect_to root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:post_image, :text).merge(user_id: current_user.id)
  end
end
