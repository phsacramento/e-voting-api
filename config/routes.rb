Rails.application.routes.draw do
  devise_for :users, path_prefix: 'auth'

	namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: "sessions#create"

      resources :users do
        collection do
          post :profile
        end
      end

      resources :roles
    end
  end
end
