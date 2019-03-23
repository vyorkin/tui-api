defmodule Tui.API.V1.TourController do
  use Tui.API, :controller

  alias Tui.Tour

  def index(conn, _params) do
    conn |> render(:index, %{tours: []})
  end
end
