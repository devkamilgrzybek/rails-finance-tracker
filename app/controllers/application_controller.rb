class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :get_chat_rooms

  def after_sign_in_path_for(resource)
    my_portfolio_path
  end
  
  def get_chat_rooms()
    @chatrooms = Chatroom.all
    @message = Message.new
  end

end