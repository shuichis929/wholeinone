class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def new
    @item = Item.new
  end
end
