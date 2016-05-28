Rails.application.routes.draw do
  resources :user_photos
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

  get '/teams' => 'teams#index'

  get '/users' => 'users#index'
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id/edit' => 'users#edit'
  get '/users/:id' => 'users#show'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  get '/games' => 'games#index'
  get '/games/:id' => 'games#show'

  get '/pub_games' => 'pub_games#index'
  post '/pub_games' => 'pub_games#create'

  post '/reviews' => 'reviews#create'

  delete '/user_photos/:id' => 'user_photos#photo_destroy' 
  get '/pub_photos/:id' => 'pub_photos#show' 

  resources :conversations do
    resources :messages
  end

  namespace :api do 
    namespace :v1 do
      get '/pubs' => 'pubs#index'

      get '/games' => 'games#index'

      get '/pub_games' => 'pub_games#index'
      post '/pub_games' => 'pub_games#create'

      get '/user_games' => 'user_games#index'
      post '/user_games' => 'user_games#create'

      get '/teams' => 'teams#index'

      get '/user_allegiances' => 'user_allegiances#index'
      post '/user_allegiances' => 'user_allegiances#create'

      get '/coords' => 'coords#fetch_search_coords'

      get '/allegiances' => 'allegiances#index'
      post '/allegiances' => 'allegiances#create'
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
