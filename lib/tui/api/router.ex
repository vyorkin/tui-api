defmodule Tui.API.Router do
  use Tui.API, :router

  pipeline :api do
    plug :accepts, ~w(json)
  end

  # pipeline :v1_auth do
  #   plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  #   plug Guardian.Plug.LoadResource, ensure: true
  #   plug Guardian.Plug.EnsureAuthenticated, handler: Tui.API.V1.AuthController
  #   plug Tui.API.Plug.CurrentUser
  # end

  scope "/v1", as: :api_v1, alias: Tui.API.V1 do
    pipe_through :api

    # scope "/auth" do
    #   post "/login", AuthController, :login
    #   post "/token/:type", AuthController, :token
    # end

    scope "/" do
      # pipe_through :v1_auth

      scope "/travel" do
        resources "/categories", TravelCategoryController, only: [:index]
      end

      resources "/geo", CountryController, only: [:index]
      resources "/cities", CityController, only: [:index]

      resources "/places", PlaceController, only: [:index]
      resources "/hotels", HotelController, only: [:index]

      resources "/countries", CountryController do
        resources "/tours", TourController, only: [:index]
      end

      resources "/profile", ProfileController, only: [:show], singleton: true
    end
  end
end
