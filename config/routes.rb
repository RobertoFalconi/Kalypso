Rails.application.routes.draw do

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

  get    'about'   => 'kalypso#about' 
  get    'faq'     => 'kalypso#faq'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'ban'     => 'users#ban'
  put    'users'   => 'users#ban'
  #get   'users'   => 'users#ban'
  resources :users

end


#get ban e put users per autoban
#get users per bannare altri utenti ma ricevere errore fatale