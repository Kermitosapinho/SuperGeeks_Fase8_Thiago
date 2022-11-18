Rails.application.routes.draw do

   # devise_for :users
   
   namespace :api, defaults: { format: :json} do
    namespace :v1, path: "/" do
      resources :users
      resources :gains
      devise_for :users, controllers: { sessons: 'api/v1/sessions' }
      # resources :sessions
    end
  end
end