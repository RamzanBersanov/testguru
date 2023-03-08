Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  devise_for :admins, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    resources :questions, only: :index, shallow: true do
      resources :answers, only: :index, shallow: true
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  
  namespace :admin do
    root 'tests#index'
  end

  namespace :admin do 
    resources :tests do
      resources :questions do
        resources :answers 
      end 
    end 
  end 
end
