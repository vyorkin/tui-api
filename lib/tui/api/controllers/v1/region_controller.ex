defmodule Tui.API.V1.RegionController do
  use Tui.API, :controller

  alias Tui.Geo

  validate_params :index, %{page: :integer}

  def index(conn, _params) do
    conn |> render(:index, %{regions: []})
  end
end
