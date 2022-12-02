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


  private

  def item_params
    params.require(:item).permit(:item_image, :item_name, :description, :category_id, :condition_id, :delivery_charge_id,
                                 :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
