DiDauAnGi::Application.routes.draw do
  
  devise_for :users
  
  post "posts/new" => "posts#create"
  match "posts/paginate" => "posts#paginate"
  
  namespace :api do
    namespace :v1 do
      resources :districts
      
      match "get_districts" => "districts#get_districts"
    end
  end
  
  namespace :api do
    namespace :v1 do
      
      match "get_subcats"     => "subcats#get_subcats"
      match "get_maincats"    => "maincats#get_maincats"
      match "get_places"      => "places#get_places"
    end
  end
  
  resources :districts
  resources :users
  resources :posts
  
  root :to => "selections#index"
end
