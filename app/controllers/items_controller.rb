class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path(@item)
    end
  end

  def show
    @item = Item.find(params[:id])
    @item_comments = @item.item_comments.includes(:user)
    @item_comment = ItemComment.new
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id && @item.purchase.blank?
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'items/edit'
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      item.destroy
      redirect_to root_path
    end
  end

  def search
    # params[:q]がnilではない且つ、params[:q][:name]がnilではないとき（商品名の欄が入力されているとき）
    # if params[:q] && params[:q][:name]と同じような意味合い
    if params[:q]&.dig(:item_name)
      # squishメソッドで余分なスペースを削除する
      squished_keywords = params[:q][:item_name].squish
      ## 半角スペースを区切り文字として配列を生成し、paramsに入れる
      params[:q][:item_name_cont_any] = squished_keywords.split(" ")
    end
    @q = Item.ransack(params[:q])
    @items = @q.result
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :item_name, :description, :category_id, :condition_id, :delivery_charge_id,
                                 :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
