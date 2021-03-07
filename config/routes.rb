Rails.application.routes.draw do
  resources :titles
  resources :sonos_systems
  resources :albums do
    member do
      get 'play'
    end
  end

  get 'pages/charts' => 'pages#charts', as: :show_charts

  root 'albums#index'
end
