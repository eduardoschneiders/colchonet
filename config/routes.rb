Colchonet::Application.routes.draw do
  LOCALES =  /en|pt\-BR/
  scope "(:locale)", locale: LOCALES do
    resources :rooms do
      resources :reviews, only: [:create, :update], module: :rooms
    end
    resources :users
  end

  resource :confirmation, only: [:show]
  resource :user_sessions, only: [:create, :new, :destroy]

  get '/:locale' => 'home#index', locale: LOCALES
  root 'home#index'

end
