Rails.application.routes.draw do

	resources :subscribers
	root 'subscribers#index'
	
  get 'subscribers/index'

	match '/contacts',     to: 'contacts#new',             via: 'get'
	resources "contacts", only: [:new, :create]

	
	
  get 'sessions/new'

  root             'kalypso#home'

  get    'about'   => 'kalypso#about' 
  get    'faq'     => 'kalypso#faq'
  get    'contact' => 'kalypso#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users

end
