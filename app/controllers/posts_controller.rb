class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

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
    @post_comments = @post.post_comments.includes(:user)
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    redirect_to action: :index unless current_user.id == @post.user_id
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

  def search
    @posts = Post.search(params[:keyword])
  end

  private
  def post_params
    params.require(:post).permit(:post_image, :text).merge(user_id: current_user.id)
  end
end
