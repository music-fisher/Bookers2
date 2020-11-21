Rails.application.routes.draw do
  get 'followers/index'
  get 'followings/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root  'homes#top'
  get 'home/about' => 'homes#about'
  resources :users do
    resources :relationships,only: [:create,:destroy]
    resources :followings,only: [:index]
    resources :followers,only: [:index]
  end
  resources :books do
  resource :favorites, only: [:create,:destroy]
  resources :post_comments, only:[:create, :destroy]
  end
end
