defmodule Tui.Geo.Geocoding do
  import Ecto.Query, warn: false

  alias Tui.Repo
  alias Tui.Geo.{
    Location,
    Point
  }

  def geocode(module, struct, name) do
    case GoogleMaps.geocode(name, language: "ru") do
      {:ok, %{"results" => results}} ->
        case results do
          [] ->
            geocode_failure(struct, name)
          [result] ->
            geocode_success(module, struct, name, result)
          _ ->
            IO.puts "бля, ну ладно!"
        end
      {:error, error_message} ->
        IO.puts("Geocoding error: " <> error_message)
        {:error, error_message}
    end
  end

  defp geocode_failure(struct, name) do
    IO.puts("-------------------------")
    IO.puts("Unable to get lat/lng for: " <> name)
    IO.puts("Entity:")
    IO.puts(struct)
    IO.puts("-------------------------")
  end

  defp geocode_success(module, struct, name, result) do
    %{"geometry" => %{"location" => coords}} = result
    %{"lat" => lat, "lng" => lon} = coords
    point = %Point{lat: lat, lon: lon}
    location =
      %Location{name: name, coordinates: point}
      |> Repo.insert!(on_conflict: :nothing)

    entity = Repo.get!(module, struct.id)
    entity
    |> module.changeset(%{location_id: location.id})
    |> Repo.update()
  end
end
