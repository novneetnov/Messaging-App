require 'rails_helper'

describe MessagesController do
	describe '#create POST action' do
		context 'with valid attributes' do
			before :each do
				user = FactoryGirl.create :user
				sign_in user
			end

			it 'creates the message' do
				post :create, messages: FactoryGirl.attributes_for(:message, user_token: ["1"])
				expect(Message.count).to eq(1)
			end

			it 'redirects to the root page' do
				post :create, messages: attributes_for(:message)
				expect(response).to redirect_to root_path
			end
		end

		context 'with invalid attributes' do
			before :each do
				user = FactoryGirl.create :user
				login_as(user, :scope => :user)
			end
			
			it 'creates an invalid message' do
				post :create, messages: attributes_for(:message, body: nil)
				expect(Message.count).to eq(0)
			end

			it 're-renders the new view' do
				post :create, messages: attributes_for(:message, body: nil)
				expect(response).to render_template :new
			end
		end
	end
end
