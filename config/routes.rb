Rails.application.routes.draw do
  namespace :rbac do
	  resources :privileges
	  resources :groups
	  resources :roles
	end
end