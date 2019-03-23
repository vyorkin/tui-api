defmodule Tui.API.V1.CityController do
  use Tui.API, :controller

  alias Tui.Geo
  #   exclude_deleted: true

  def index(conn, _params) do
    # cities = Geo.country_cities(conn.assigns.country)
    cities = Geo.list_cities()
    conn |> render(:index, %{cities: cities})
  end
end
