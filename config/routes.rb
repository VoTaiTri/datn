Rails.application.routes.draw do
  get 'departments/new'

  root  'static_pages#home'
  get   'static_pages/about'

  resources :departments
end
