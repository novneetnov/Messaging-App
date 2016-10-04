require 'rails_helper'

feature	'user creates a new message' do
	scenario 'successfully' do
		user = FactoryGirl.create(:user)
		user2 = FactoryGirl.create(:user)
		login_as(user, :scope => :user)
		visit root_path

		click_on 'New'
		fill_in 'Message', with: 'Body goes here'
		check('user' + user.id.to_s)
		check('user' + user2.id.to_s)
		click('submit')

		expect(page).to have_content "Message Sent!"
	end
end
