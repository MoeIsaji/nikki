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
  devise_for :admin, skip: [:passwords], controllers: {
    registrations: "admin/registrations",
  sessions: "admin/sessions"
  }

  # viewページ
  root to: "homes#top"
  scope module: :public do
    resources :articles, only:[:index,:show,:edit,:create,:destroy,:update ,:new] do
      resources :comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
      end
      patch '/customers/:id/edit(.:format)' => 'customers#edit'
      get '/likes/:id(.:format)' => 'likes#likes'
    resources :customers, only:[:destroy, :index,:show,:edit,:update, :likes] do
      resource :relationships, only: [:create, :destroy]
      get :likes, on: :collection
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      end
    get '/search', to: 'search_articles#search'
  end

  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update, :destroy]
  end

end