Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => "homes#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'relationship/following' => "relationships#following", as: 'following'
    get 'relationship/follower' => "relationships#follower", as: 'follower'
  end
  
  get 'searches/search' => "searches#search", as: 'search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end