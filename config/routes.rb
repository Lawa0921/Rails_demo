Rails.application.routes.draw do
  resources :categories
  resources :items
  # get "/", to: "welcome#index"
  root "items#index" # ← 針對首頁的簡短寫法
  get "/login", to: "users#login"
  post "/login", to: "users#sign_in"
  delete "/logout", to: "users#logout"
  # delete :logout, to: "users#logout", path 'cccc'

  get "/sign_up", to: "users#sign_up"
  post "/sign_up", to: "users#registration"

end