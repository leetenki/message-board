class MessagesController < ApplicationController
  def index
  	@messages = Message.all
  end

  #append
  def create
  	@message = Message.new(message_params)
  	@message.save
  	redirect_to root_path , notice: "save the message"
  end

  private
  def message_params
  	params.require(:message).permit(:name, :body)
  end

end
