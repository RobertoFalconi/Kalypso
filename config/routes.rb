Rails.application.routes.draw do

  resources :sites
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
  get    'signup'           => 'users#new'
  get    'login'            => 'sessions#new'
  post   'login'            => 'sessions#create'
  delete 'logout'           => 'sessions#destroy'
    
  get    'ban'              => 'users#ban'
  put    'users'            => 'users#ban'
    
  get    'suspend'          => 'sites#suspend'
  put    'sites'            => 'sites#suspend'
  
  #get   'users'   => 'users#ban'
  resources :users

end


#get ban e put users per autoban
#get users per bannare altri utenti ma ricevere errore fatale