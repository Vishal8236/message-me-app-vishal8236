class ChatroomController < ApplicationController
  before_action :require_user
  def index
    @message = Message.new #this line of code for create new message from index page
    @messages = Message.custom_display
  end
end
