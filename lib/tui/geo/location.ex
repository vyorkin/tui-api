defmodule Tui.Geo.Location do
  use Tui.API, :model

  schema "locations" do
    field :name, :string
    field :coordinates, Tui.Geo.Point.Type
    field :deleted_at, :naive_datetime

    has_many :countries, Tui.Geo.Country
    has_many :cities, Tui.Geo.City

    timestamps(updated_at: false)
  end
end
