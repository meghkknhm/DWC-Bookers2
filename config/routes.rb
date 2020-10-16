Rails.application.routes.draw do
  resources :books
  devise_for :users
  get 'top' => 'homes#top'
  root to: 'homes#top'
  get "home/about" => "homes#about"
  resources :users

end
