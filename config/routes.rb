Rails.application.routes.draw do
  root "employees#index"

  resources :employees do
    resources :admins
  end
end
