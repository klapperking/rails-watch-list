Rails.application.routes.draw do
  get 'movies/search'
  resources :lists, except: %i[edit update] do

    # TODO: Refactor create and destroy routes outside nested route
    resources :bookmarks, only: %i[new create destroy]
    resources :reviews, only: %i[new create]
  end

  # Movie search
  get '/movies', to: 'movies#index', as: :movies
  post '/movies/search', to: 'movies#search', as: :search_movies

  # Base Redirect
  get '/', to: 'lists#index'
end
