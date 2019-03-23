defmodule Tui.Geo.City do
  use Tui.API, :model

  alias Tui.Geo.{Country, Region, Location}

  schema "cities" do
    field :name, :string
    field :name_lat, :string
    field :deleted_at, :naive_datetime

    belongs_to :location, Location
    belongs_to :country, Country
    belongs_to :region, Region

    timestamps()
  end

  @fields ~w(name name_lat country_id region_id location_id)a
  def changeset(struct, attrs) do
    struct
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
