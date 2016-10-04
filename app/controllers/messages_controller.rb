class MessagesController < ApplicationController
	before_action :authenticate_user!

	def index
		@messages = Recipient.where(user_id: current_user.id).order('created_at DESC')
	end

	def new
		@message = Message.new		
		@recipients = User.all
	end

	def create
		@message = current_user.messages.build(message_params)

		if @message.save
			redirect_to	root_path, success: "Message Sent!"
		else
			render :new, alert: "Great Scott!"
		end
	end

	private
	def message_params
		params.require(:message).permit(:body, :sender_id, user_tokens: [])
	end
end
