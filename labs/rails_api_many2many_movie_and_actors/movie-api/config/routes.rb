Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/actors/:actor_id' do
    resources :movies
  end
  
  scope '/movies/:movie_id' do
    resources :actors
  end
end
