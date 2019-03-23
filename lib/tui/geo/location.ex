defmodule Tui.Geo.Location do
  use Tui.API, :model

  alias Tui.Geo.{Country, City, Point}

  schema "locations" do
    field :name, :string
    field :coordinates, Point.Type
    field :deleted_at, :naive_datetime

    has_many :countries, Country
    has_many :cities, City

    timestamps(updated_at: false)
  end
end
