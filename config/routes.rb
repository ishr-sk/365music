Rails.application.routes.draw do
  root to: 'homes#top'
  # ゲストログイン
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
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

  # 退会処理
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  patch '/users/:id/withdraw' => 'users#withdraw', as: 'withdraw'
  # put 'user/withdraw' => 'users#withdraw'

  # DM機能
  get 'direct_message/:id' => 'direct_messages#show', as: 'direct_message'
  resources :direct_messages, only: [:create]

  # セットリスト機能
  resources :setlists, only: [:new, :create, :index, :show, :edit, :update]

  # スケジュール機能
  resources :schedules, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  get 'my_calendar', to: 'schedules#my_calendar'

  # 検索機能
  get 'search' => 'searches#search'
  
  # 問い合わせ機能
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'thanks', to: 'contacts#thanks', as: 'thanks'
end
