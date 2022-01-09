Rails.application.routes.draw do
  resources :journal_entries
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'static_pages#index'
end
