Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
  get 'post/hashtag/:name' => 'posts#hashtag'

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings', on: :member
    get 'followers', on: :member
  end
  
  get 'direct_message/:id' => 'direct_messages#show', as: 'direct_message'
  resources :direct_messages, only: [:create]
  
  resources :setlists, only: [:new, :create, :index, :show, :edit, :update]

end