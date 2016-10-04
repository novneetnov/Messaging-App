Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }	
	root to: "static_pages#root"
	resources :messages, only: [:create, :new, :index]

end
