Rails.application.routes.draw do

  resources :subscribers
  get    'subscribers'=>'subscribers/index'
#	root 'subscribers#index'
	
#  get 'subscribers' => 'subscribers/index'

  match '/contacts', to: 'contacts#new', 					via: 'get'
	
  resources "contacts", only: [:new, :create]

#  get 'message and key' 
  
	
  get 'sessions/new'

  root                'kalypso#home'

  get    'about'   => 'kalypso#about' 
  get    'faq'     => 'kalypso#faq'

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :users

end
