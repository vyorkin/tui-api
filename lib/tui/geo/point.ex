defmodule Tui.Geo.Point do
  defstruct lat: 0, lon: 0

  defmodule Type do
    @behaviour Ecto.Type

    def type, do: :point

    def blank?(nil), do: true
    def blank?(_), do: false

    def load(%Postgrex.Point{x: lat, y: lon}) do
      {:ok, %Tui.Geo.Point{lat: lat, lon: lon}}
    end
    def load(_), do: :error

    def dump(%Tui.Geo.Point{lat: lat, lon: lon}) do
      {:ok, %Postgrex.Point{x: lat, y: lon}}
    end
    def dump(_), do: :error

    def cast(%Tui.Geo.Point{} = point), do: {:ok, point}
    def cast(%{lat: lat, lon: lon}) do
      {:ok, %Tui.Geo.Point{lat: lat, lon: lon}}
    end
    def cast(%{"lat" => lat, "lon" => lon}) do
      {:ok, %Tui.Geo.Point{lat: lat, lon: lon}}
    end
    def cast([lat, lon]) do
      {:ok, %Tui.Geo.Point{lat: lat, lon: lon}}
    end
    def cast(_), do: :error
  end
end
