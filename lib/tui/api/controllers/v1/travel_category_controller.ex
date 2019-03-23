defmodule Tui.API.V1.TravelCategoryController do
  use Tui.API, :controller

  alias Tui.Travel

  def index(conn, _params) do
    travel_categories = Travel.list_travel_categories()
    conn |> render(:index, %{travel_categories: travel_categories})
  end
end
