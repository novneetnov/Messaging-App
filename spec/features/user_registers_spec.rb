require 'rails_helper'

describe 'user registers an account' do
	it 'successfully' do
		visit new_user_registration_path

		fill_in 'Username', with: 'username'
		fill_in 'Email', with: 'test@test.com'
		fill_in 'Password', with: 'password'
		fill_in 'Password confirmation', with: 'password'
		click_button 'Sign up'

		expect(page).to have_content 'Welcome! You have signed up successfully.'
	end
end
