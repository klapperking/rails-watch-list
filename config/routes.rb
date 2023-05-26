Rails.application.routes.draw do
  resources :lists, except: %i[edit update] do
    resources :bookmarks, only: %i[new create destroy]
    resources :reviews, only: %i[new create]
  end
end
