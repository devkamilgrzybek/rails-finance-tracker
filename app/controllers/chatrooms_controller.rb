class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end
  
  def create
    @chatroom = current_user.chatrooms.build(chat_room_params)
    if @chatroom.save
      flash[:success] = 'Chat room added!'
      redirect_to chatrooms_path
    else
      render 'new'
    end
  end

  def chat_room_params
    params.require(:chatroom).permit(:topic)
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy
    flash[:notice] = "Chatroom was successfully removed"
    redirect_to chatrooms_path
  end 
end