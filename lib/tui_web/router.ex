defmodule TuiWeb.Router do
  use TuiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TuiWeb do
    pipe_through :api
  end
end
