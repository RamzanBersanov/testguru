# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'my_devise/sessions' }
  devise_for :admins, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: %i[index start] do
    resources :questions, only: :index, shallow: true do
      resources :answers, only: :index, shallow: true
    end

    post :start, on: :member
  end

  resources :contacts, only: %i[new create]

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
    resources :gists, only: :create
  end

  resources :contacts, only: %i[new create]

  namespace :admin do
    root 'tests#index'
  end

  namespace :admin do
    resources :gists, only: :index
  end

  namespace :admin do
    resources :tests, only: %i[index show edit update new create destroy] do
      patch :update_inline, on: :member
      resources :questions, only: %i[index show edit update new create destroy], shallow: true do
        resources :answers, only: %i[index show edit update new create destroy], shallow: true
      end
    end
  end
end
