class MessagesController < ApplicationController
  before_action :set_message, :only => [:edit, :update, :destroy]

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to root_path, notice: 'メッセージ編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
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

  def set_message
    @message = Message.find(params[:id])
  end

  private
  def message_params
  	params.require(:message).permit(:name, :body, :age)
  end
end
