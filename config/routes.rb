Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/speakers" => "speakers#index"
    get "/speakers/:id" => "speakers#show"

    get "/meetings" => "meetings#index"
    get "/meetings/:id" => "meetings#show"
  end
end
