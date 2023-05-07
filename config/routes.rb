Rails.application.routes.draw do

  # devise_for :guest_users
  # devise_for :guests

  # get '/search_articles', to: 'articles#search'
  # キーワード検索
  # get "search" => "searches#search"


  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: "homes#top"

    # post '/guest_sign_in', to: 'sessions#new_guest'
    # get '/guest_sign_in', to: 'sessions#new_guest'


    get '/users/my_page' => "users#show"
    # post '/answers/confirm' => 'answers#confirm', as: 'confirm'
    # get '/answers/complete' => 'answers#complete', as: 'complete'

    resources :questions do
      resource :answers, only: [:new, :create, :edit, :update]

    end


  end

  namespace :admin do
    get '/admin' => "homes#top"
    resources :images, only: [:new, :create, :edit, :update, :destroy]
    # get "search" => "searches#search"
    get "search" => "searches#index"
    resources :questions, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :choices, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :favorites, only: [:create, :destroy]
    # resources :answers, only: [:index]
    get '/questions/:question_id' => "answers#index"
    # get '/questions/:question_id/choices' => "answers#index", as: 'index'
    get '/questions/:question_id/choices/:choice_id/' => "answers#show", as: 'show'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

