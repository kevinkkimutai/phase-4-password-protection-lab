Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # users routes
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/signup", to: "users#create"
  get "/me", to: "users#show"

  # todo routes
  get '/', to: "todos#list"
  get '/show', to: "todos#show"
  post '/create', to: "todos#create"
  put '/update/:id', to: "todos#update"
  delete '/destroy/:id', to: "todos#destroy"
end
