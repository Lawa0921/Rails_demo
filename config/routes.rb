Rails.application.routes.draw do
  # get "/", to: "welcome#index"
  root "items#index" # ← 針對首頁的簡短寫法

  resources :categories
  resources :items do
    member do
      post :add_to_cart
    end
    resources :comments, only: [:create]
  end

  namespace :api do
    namespace :v1 do
      resources :items, only: [] do
        member do
          # 這個裡面的路徑會帶ID
          post :favorite
        # post => /items/2/favorited
        end
      end
    end
  end


  # post "cart/:id", to: "cart#add", as: :cart

  resource :cart, only: [:show, :destroy]



  get "/login", to: "users#login"
  post "/login", to: "users#sign_in"
  delete "/logout", to: "users#logout"
  # delete :logout, to: "users#logout", path 'cccc'

  get "/sign_up", to: "users#sign_up"
  post "/sign_up", to: "users#registration"

end



# namespace :api do
#   resuoures :items do
#     member do
#       # 這個裡面的路徑會帶ID
#       post :favorite
#       # post => /items/2/favorited
#     end
#     collection do
#       # 這個裡面的路徑不會帶ID
#       get :all
#       # get => /items/all
#     end
# end

# end

# 這裡會長出 post => /api/items/2/favorite
# 跟         get =>  /api/items/all

# namespace :api do
#   namespace : v1 do
#     resuoures :items do
#       member do
#         # 這個裡面的路徑會帶ID
#       post :favorite
#       # post => /items/2/favorited
#     end
#       collection do
#         # 這個裡面的路徑不會帶ID
#       get :all
#       # get => /items/all
#       end
#     end
#   end
# end

# 這裡會長出 post => /api/v1/items/2/favorite
# 跟         get =>  /api/v1/items/all