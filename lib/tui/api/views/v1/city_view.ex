defmodule Tui.API.V1.CityView do
  use Tui.API, :view

  alias Tui.API.V1.LocationView

  @attrs [
    :id, :name, :region_id,
    :inserted_at, :updated_at
  ]

  def render("index.json", %{cities: cities}) do
    render_many(cities, __MODULE__, "show.json")
  end

  def render("show.json", %{city: city}) do
    city
    |> Map.take(@attrs)
    |> Map.put(:location, render_one(city.location, LocationView, "show.json"))
    |> Map.put(:deleted, !is_nil(city.deleted_at))
  end
end
