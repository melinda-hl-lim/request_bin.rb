Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'bins#new'

  get 'data/:bin_slug', to: 'bins#show', key: :slug, as: 'bin'
  resources :bins, only: %i[new create delete]

  match ':bin_slug', to: 'requests#create', via: %i[get post]
  resources :requests, only: [:show]
end
