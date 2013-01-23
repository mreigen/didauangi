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
    
  resources :users
  resources :posts
  
  root :to => "selections#index"
end
