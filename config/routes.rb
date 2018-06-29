Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  resources :comments
  devise_for :users
 
  get 'comment/new'
  get 'comment/create'
  get 'comment/destroy'
  get 'comment/index'
  put 'posts/:id/edit', to: "posts#edit"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
