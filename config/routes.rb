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
    resources :my_pages, only:[:show, :update, :edit, :bye, :byebye]
    resources :articles, only:[:index,:show]
    resources :my_articles, only:[:show, :open_close, :destroy, :new, :create, :update]
    resources :likes, only:[:index]
    resources :follows, only:[:index]
    resources :followers, only:[:index]
    resources :serch_articles, only:[:index]
  end

  namespace :admin do
    resources :users, only:[:index, :show, :edit, :update]
  end

end
