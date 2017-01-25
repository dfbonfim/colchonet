Rails.application.routes.draw do

  LOCALES = /en|pt/

  scope "(:locale)", :locale => LOCALES do
    resources :rooms
    resources :users
  end

  get '/:locale' => 'home#index', :locale => LOCALES
  root 'home#index'
end
