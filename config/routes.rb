Rails.application.routes.draw do
  root 'pages#root'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_github_omniauth_session
  end
end
