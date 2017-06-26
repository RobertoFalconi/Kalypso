Rails.application.routes.draw do
  get 'users/new'

#  get 'kalypso/home'

  get 'kalypso/about'
  get 'kalypso/faq'

  root 'kalypso#home'

end
