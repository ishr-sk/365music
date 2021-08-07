Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  get 'post/hashtag/:name' => 'posts#hashtag'
  
  resources :users, only: [:index, :show, :edit, :update]
  
end
