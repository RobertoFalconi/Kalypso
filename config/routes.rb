Rails.application.routes.draw do

  root             'kalypso#home'

  get 'about'   => 'kalypso#about' 
  get 'faq'     => 'kalypso#faq'
  get 'contact' => 'kalypso#contact'
  get 'signup'  => 'users#new'

  resources :users

end
