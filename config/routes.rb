Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/products' => 'products#index'
  get '/products/new' =>'products#new'
  post '/products' => 'products#create'
  get '/products/:id' => 'products#show'
  get 'products/:id/edit' => 'products#edit'
  patch '/products/:id' => 'products#update'
  delete 'products/:id' => 'products#destroy'
  post '/search' => 'products#search'

  get '/suppliers' => 'suppliers#index'
  get '/suppliers/new' =>'suppliers#new'
  post '/suppliers' => 'suppliers#create'
  get '/suppliers/:id' => 'suppliers#show'
  get 'suppliers/:id/edit' => 'suppliers#edit'
  patch '/suppliers/:id' => 'suppliers#update'
  delete 'suppliers/:id' => 'suppliers#destroy'
  post '/search' => 'suppliers#search'

# These routes are not restful but are done this way to bow to web coventions

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  post '/orders' => 'orders#create' 
  get  '/orders/:id' => 'orders#show'

  post '/cart' => 'carted_products#create' 
  get  '/cart' => 'carted_products#index'
  delete 'cart/:id' => 'carted_products#destroy'

end
