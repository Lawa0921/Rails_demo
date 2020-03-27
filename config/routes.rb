Rails.application.routes.draw do
  # get "/", to: "welcome#index"
  root "welcome#index" # ← 針對首頁的簡短寫法
  get "/login", to: "users#login"
  get "/sign_up", to: "users#sign_up"
  post "/sign_up", to: "users#registration"
end
