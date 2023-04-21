Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root to: "homes#top"

    get '/users/my_page' => "users#show"
    # post '/answers/confirm' => 'answers#confirm', as: 'confirm'
    # get '/answers/complete' => 'answers#complete', as: 'complete'

    resources :questions do
      resource :answers, only: [:new, :create, :edit, :update]

    end


  end

  namespace :admin do
    get '/admin' => "homes#top"
    resources :questions, only: [:new, :create]
    resources :choices, only: [:new, :create, :index]

    get '/questions/:question_id' => "answers#index"
    get '/questions/:question_id/choices/:choice_id/' => "answers#show", as: 'show'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

