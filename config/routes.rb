Rails.application.routes.draw do
  scope '/api' do
    post 'login' => 'user_token#create'

    constraints(id: /\d+/) do
      resources :users, only: [:index] do
        collection do
          post '/follow_user/:id', to: 'users#follow_user'
          delete '/unfollow_user/:id', to: 'users#unfollow_user'
          get '/logged_user', to: 'users#get_logged_user'
        end
      end
      resources :posts
      resources :comments, except: [:destroy, :update]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
