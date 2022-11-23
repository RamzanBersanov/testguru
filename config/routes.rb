Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true
  end

  get '/tests/:test_id/questions', to: 'questions#index'
  get '/questions/:id', to: 'questions#show'
  get '/tests/:test_id/questions/new', to: "questions#new"
  post '/tests/:test_id/questions(.:format)', to: "questions#create"
  delete '/questions/:id', to: 'questions#destroy'
end
