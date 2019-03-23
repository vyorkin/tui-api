defmodule Mix.Tasks.Sync do
  use Mix.Task

  alias Tui.Gateway.{CountryGateway, RegionGateway, CityGateway}
  alias Tui.Repo
  alias Tui.Geo.{Geocoding, Country, Region, City}

  @gateways [
    CountryGateway,
    RegionGateway,
    CityGateway
  ]

  @shortdoc "Кэширование данных в локальной БД"
  def run(_) do
    start()

    countries =
      CountryGateway.fetch()
      |> Enum.map(&set_timestamps/1)

    country_ids = Enum.map(countries, &(&1.id))

    Repo.insert_all(Country, countries, on_conflict: :nothing)

    countries |> Enum.map(fn e -> Geocoding.geocode(Country, e, e.name) end)

    regions =
      RegionGateway.fetch()
      |> Enum.filter(fn e -> Enum.member?(country_ids, e.country_id) end)
      |> Enum.map(&set_timestamps/1)

    region_ids = Enum.map(regions, &(&1.id))

    Repo.insert_all(Region, regions, on_conflict: :nothing)

    cities =
      CityGateway.fetch()
      |> Enum.filter(fn e ->
        Enum.member?(region_ids, e.region_id) &&
        Enum.member?(country_ids, e.country_id)
      end)
      |> Enum.map(&set_timestamps/1)

    Repo.insert_all(City, cities, on_conflict: :nothing)

    cities |> Enum.map(fn e -> Geocoding.geocode(City, e, e.name) end)
  end

  defp set_timestamps(item) do
    now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)
    Map.merge(item, %{inserted_at: now, updated_at: now})
  end

  defp start do
    Mix.Task.run "app.start"
    Enum.map(@gateways, &(&1.start))
  end
end
