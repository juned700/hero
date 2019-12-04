Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/events" => "events#index", as: :events
  get "/events/:id" => "events#show", as: :event

  root :to => "home#index"
end
