Rails.application.routes.draw do
  namespace :admin do
    get "/plainpage", to: "plainpage#index"
    resources :introduces
  end
end
