Rails.application.routes.draw do
  root "react_app#home"
  namespace :api do
    namespace :v1 do
      resources :menus
    end
  end
  namespace :admin do
    get "/plainpage", to: "plainpage#index"
    resources :introduces
    resources :menus
    resources :slides
    resources :group_products
    resources :products
  end
end
