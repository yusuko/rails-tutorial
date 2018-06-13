class MessagesController < ApplicationController
  def index
    @message = Message.new
    @user = User.find(params[:id])
    @messages = Message.dm(current_user.id,@user.id)
  end

  def create
    message = current_user.sending.build(message_params)
    user = User.find(params[:message][:user_id])
    if message.save
      redirect_to dm_user_url(user,other_user:current_user.id)
    end
  end

  private

  def message_params
    params.require(:message).permit(:user_id,:content)
  end


end