Rails.application.routes.draw do
  namespace :admin do
    get "/plainpage", to: "plainpage#index"
    resources :introduces
    resources :menus
    resources :slides
    resources :group_products
    resources :products
  end
end
