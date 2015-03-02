Rails.application.routes.draw do
  get 'admin' => 'admin/static_pages#home'

  get 'sessions/new'

  root  'static_pages#home'
  get   'static_pages/about'
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :departments
  resources :lecturers

  namespace :admin do
    resources :lecturers
    resources :departments
  end
end