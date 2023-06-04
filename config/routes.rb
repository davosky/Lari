Rails.application.routes.draw do
  root "home#index"

  get "home/index"
  get "home/credits"
  get "home/howto"

  resources :occupations
  resources :subscription_reasons
  resources :public_sectors
  resources :private_sectors
  resources :categories
  resources :delivery_cards
  resources :subscription_types
  resources :subscribers
  resources :landlords

  devise_for :operators, skip: [:registrations]
  as :operator do
    get "operators/edit" => "devise/registrations#edit", :as => "edit_operator_registration"
    put "operators" => "devise/registrations#update", :as => "operator_registration"
  end

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
end
