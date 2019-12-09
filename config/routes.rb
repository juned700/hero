Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/events" => "events#index", as: :events
  get "/events/new" => "events#new", as: :new_event
  get "/events/:id" => "events#show", as: :event
  get "/events/:id/edit" => "events#edit", as: :edit_event
  patch "/events/:id" => "events#update"
  post '/events' => "events#create"
  delete "/events/:id" => "events#destroy", as: :destroy_event

  root :to => "home#index"
end
