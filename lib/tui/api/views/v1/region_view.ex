defmodule Tui.API.V1.RegionView do
  use Tui.API, :view

  @attrs [
    :id, :name, :country_id,
    :inserted_at, :updated_at
  ]

  def render("index.json", %{regions: regions}) do
    render_many(regions, __MODULE__, "show.json")
  end

  def render("show.json", %{region: region}) do
    region
    |> Map.take(@attrs)
    |> Map.put(:deleted, !is_nil(region.deleted_at))
  end
end
