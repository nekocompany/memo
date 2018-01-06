Rails.application.routes.draw do
  root to: 'memorandums#index'
  resources :memorandums
end
