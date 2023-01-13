class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages.includes(:user)
  end

  def search
    @rooms = Room.search(params[:keyword])
  end
  
  private

  def room_params
    params.require(:room).permit(:room_name, :explanation)
  end
end
