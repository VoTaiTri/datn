Rails.application.routes.draw do
  root  'static_pages#home'
  get   'static_pages/about'
  
	get 'lecturers/new'
  get 'departments/new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :departments
  resources :lecturers
end
