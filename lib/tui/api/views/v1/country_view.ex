defmodule Tui.API.V1.CountryView do
  use Tui.API, :view

  alias Tui.API.V1.{LocationView, CityView}

  @attrs [
    :id, :name, :name_lat,
    :inserted_at, :updated_at
  ]

  def render("index.json", %{countries: countries}) do
    render_many(countries, __MODULE__, "show.json")
  end

  def render("show.json", %{country: country}) do
    country
    |> Map.take(@attrs)
    |> Map.put(:location, render_one(country.location, LocationView, "show.json"))
    |> Map.put(:cities, render_many(country.cities, CityView, "show.json"))
    |> Map.put(:deleted, !is_nil(country.deleted_at))
  end
end
