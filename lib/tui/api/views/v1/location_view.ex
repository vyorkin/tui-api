defmodule Tui.API.V1.LocationView do
  use Tui.API, :view

  def render("index.json", %{locations: locations}) do
    render_many(locations, __MODULE__, "show.json")
  end

  def render("show.json", %{location: location}) do
    location
    |> Map.take([:id])
    |> put_coordinates(location.coordinates)
  end

  def put_coordinates(json, nil), do: json
  def put_coordinates(json, coords) do
    json
    |> Map.put(:lat, coords.lat)
    |> Map.put(:lon, coords.lon)
  end
end
