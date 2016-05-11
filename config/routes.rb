Rails.application.routes.draw do
  devise_for :user_logins
  devise_for :pub_users

  get '/' => 'pubs#main'
  get '/pubs' => 'pubs#index'
  get '/pubs/new' => 'pubs#new'
  post '/pubs' => 'pubs#create'
  get '/pubs/:id/edit' => 'pubs#edit'
  patch '/pubs/:id' => 'pubs#update'
  get '/pubs/:id' => 'pubs#show'
  delete '/pubs/:id' => 'pubs#destroy'

  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id/edit' => 'users#edit'
  get '/users/:id' => 'users#show'
  patch '/users/:id' => 'users#update'

  get '/games' => 'games#index'
  get '/games/:id' => 'games#show'

  get '/pub_games' => 'pub_games#index'
  post '/pub_games' => 'pub_games#create'

  post '/reviews' => 'reviews#create'


  namespace :api do 
    namespace :v1 do
      get '/pubs' => 'pubs#index'
      get '/games' => 'games#index'
      get '/pub_games' => 'pub_games#index'
      post '/pub_games' => 'pub_games#create'
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

end
