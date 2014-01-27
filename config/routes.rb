Colchonet::Application.routes.draw do
  LOCALES =  /en|pt\-BR/
  scope "(:locale)", locale: LOCALES do
    resources :rooms
    resources :users
  end

  resource :confirmation, only: [:show]

  get '/:locale' => 'home#index', locale: LOCALES
  root 'home#index'

end
