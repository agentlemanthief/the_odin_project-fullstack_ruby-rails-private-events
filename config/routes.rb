Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events do
    member do
      put '/events/:id', to: 'invitations#attend', as: :attend
      delete 'events/:id', to: 'invitations#cancel_attend', as: :cancel_attend
    end
  end
  resources :users, only: [:show]
end
