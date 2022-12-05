class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    @message.save
    if @message.save
      redirect_to room_path(@room.id)
    else
      @messages = @room.messages.includes(:user)
      render template: "rooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
