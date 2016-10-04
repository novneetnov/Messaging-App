require 'rails_helper'

feature 'user visits the homepage' do
	scenario 'successfully' do
		visit root_path
		expect(page.status_code).to eq(200)
	end
end
