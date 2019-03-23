defmodule Tui.API.V1.TourController do
  use Tui.API, :controller

  alias Tui.Tour

  plug Tui.API.Plug.FindEntity,
    entity: Tui.Geo.Country,
    param: "country_id",
    key: :country,
    exclude_deleted: true

  def index(conn, _params) do
    tours = Tour.list_tour_offers(conn.assigns.country)
    conn |> render(:index, %{tours: tours})
  end
end
