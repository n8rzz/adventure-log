Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  authenticate :user do
    resources :journal_entries
  end

  root to: 'static_pages#index'
end
