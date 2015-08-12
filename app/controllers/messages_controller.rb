class MessagesController < ApplicationController
  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to root_path, notice: 'メッセージ編集しました'
    else
      render 'edit'
    end
  end


  #index
  def index
  	@messages = Message.all
  	@message = Message.new
  end

  #append
  def create
  	@message = Message.new(message_params)
  	if @message.save
	  	redirect_to root_path , notice: "メッセージを保存しました"
  	else
  		@messages = Message.all
  		flash.now[:alert] = "メッセージ保存失敗"
  		render "index"
  	end
  end


  private
  def message_params
  	params.require(:message).permit(:name, :body)
  end
end
