Rails.application.routes.draw do
  get 'admin' => 'admin/static_pages#home'

  get 'sessions/new'

  root  'static_pages#home'
  get   'static_pages/about'
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :departments, :only => [:index, :show]
  resources :lecturers
  resources :subjects

  namespace :admin do
    resources :lecturers
    resources :departments
    resources :subjects
  end
end