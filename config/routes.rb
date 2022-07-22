Rails.application.routes.draw do


  # devise関連
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  # viewページ
  root to: "homes#top"
  scope module: :public do
    resources :articles, only:[:index,:show,:edit,:create,:destroy,:update] do
      resources :comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
      end
    resources :customers, only:[:index,:show,:edit,:update] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      end
    get '/search', to: 'searche_articles#search'
  end

  namespace :admin do
    resources :users, only:[:index, :show, :edit, :update]
  end

end
