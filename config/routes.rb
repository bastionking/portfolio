Rails.application.routes.draw do
  resources :infos, except: [:show]

  get 'info/:id', to: 'infos#show', as: 'info_show'

  get 'about', to: 'pages#about'

  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'
end
