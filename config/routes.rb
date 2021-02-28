Rails.application.routes.draw do
  resources :titles
  resources :sonos_systems
  resources :albums do
    member do
      get 'play'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'albums#index'
end
