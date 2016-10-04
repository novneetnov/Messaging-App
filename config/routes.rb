Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }	
	root to: "messages#index"
	resources :messages, only: [:create, :new, :index]

end
