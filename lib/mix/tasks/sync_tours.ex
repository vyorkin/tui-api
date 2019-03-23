defmodule Mix.Tasks.SyncTours do
  use Mix.Task

  alias Tui.Gateway.{CountryGateway, RegionGateway, CityGateway, TourGateway}
  alias Tui.Repo
  alias Tui.Geo.{Geocoding, Country, Region, City}
  alias Tui.Tour
  alias Tui.Tour.Offer

  @shortdoc "Кэширование Tour-данных в локальной БД"
  def run(_) do
    start()

    countries = Repo.all(Country)
    countries |> Enum.map(fn country ->
      tour = TourGateway.fetch(country.id)
      Tour.create_offer!(%{data: tour})

      IO.puts "TOUR:"
      IO.inspect tour
    end)
  end

  defp start do
    Mix.Task.run "app.start"
    TourGateway.start()
  end
end
