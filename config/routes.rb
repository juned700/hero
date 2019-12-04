Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/events" => "events#index"
  get "/events/1" => "events#show"
end
