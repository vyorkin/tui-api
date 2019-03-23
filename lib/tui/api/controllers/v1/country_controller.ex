defmodule Tui.API.V1.CountryController do
  use Tui.API, :controller

  alias Tui.Geo

  def index(conn, _params) do
    countries = Geo.list_countries()
    conn |> render(:index, %{countries: countries})
  end
end
