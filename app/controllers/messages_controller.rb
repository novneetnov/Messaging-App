class MessagesController < ApplicationController
	before_action :authenticate_user!

	def index
		@recipients = Recipient.where(user_id: current_user.id).order('created_at DESC')
	end

	def new
		@message = Message.new		
		@recipients = User.all
	end

	def create
		@message = current_user.messages.build(message_params)
		@recipients = User.all
		if @message.save
			flash[:success] = "Message Sent!"
			redirect_to	root_path 
		else
			flash.now[:error] = "Great Scott!"
			render :new 
		end
	end

	private
	def message_params
		params.require(:messages).permit(:body, :user_tokens => [])
	end
end
