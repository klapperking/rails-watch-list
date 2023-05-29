Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists, except: %i[index edit update] do

    # TODO: Refactor create and destroy routes outside nested route
    resources :bookmarks, only: %i[new create destroy]
    resources :reviews, only: %i[new create]
  end

  # Movies search
  get '/movies', to: 'movies#index', as: :movies
end
