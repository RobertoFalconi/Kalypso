Rails.application.routes.draw do

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
