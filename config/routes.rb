Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'cocktails#index'
  resources :cocktails do
    resources :doses, only: [:new, :create]
  end

  delete 'doses/:id', to: 'doses#destroy', as: :delete_dose
  get 'users/:id' => 'users#show', as: :dashboard
end
