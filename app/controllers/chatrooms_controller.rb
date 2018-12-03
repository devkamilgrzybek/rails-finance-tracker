class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new

    if params[:id].blank?
      flash.now[:danger] = "Chat with that name doesn't exist"
    end

    respond_to do |format|
      format.js { render partial: 'chatrooms/show' }
    end
  end

  def new
    @chatroom = Chatroom.new
  end
  
  def create
    @chatroom = current_user.chatrooms.build(chat_room_params)
    if @chatroom.save
      flash[:success] = 'Chat room added!'
      redirect_to my_portfolio_path
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
    redirect_to my_portfolio_path
  end 
end