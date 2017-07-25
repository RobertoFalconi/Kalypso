Rails.application.routes.draw do

  resources :sites
	resources :users
  resources :subscribers
  get    'subscribers'=>'subscribers/index'
#	root 'subscribers#index'
	
#  get 'subscribers' => 'subscribers/index'

  match '/contacts', to: 'contacts#new', via: 'get'
	
  resources "contacts", only: [:new, :create]

#  get 'message and key' 
  
 match '/messages', to: 'messages#new', via: 'get'	
 resources "messages", only: [:new, :create]
	
	
  get 'sessions/new'

  root                'kalypso#home'

  get    'about'            => 'kalypso#about' 
  get    'faq'              => 'kalypso#faq'
  get	 'suspended'        => 'kalypso#suspended'
  get	 'specialoptions'   => 'kalypso#specialoptions'
  get    'edittest'         => 'kalypso#edittest'
  get    'signup'           => 'users#new'
	
  get    'login'            => 'sessions#new'
  post   'login'            => 'sessions#create'
	
  delete 'logout'           => 'sessions#destroy'

  get 'restore'				=> 'sessions#restore'
  post 'restore'			=> 'sessions#restored'
	
  get    'ban'              => 'users#ban'
  put    'users'            => 'users#ban'
    
  get    'suspend'          => 'sites#suspend'
  put    'sites'         	=> 'sites#suspend'
	

end