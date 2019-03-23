defmodule Tui.Geo.City do
  use Tui.API, :model

  schema "cities" do
    field :name, :string
    field :name_lat, :string
    field :deleted_at, :naive_datetime

    belongs_to :location, Tui.Geo.Location
    belongs_to :country, Tui.Geo.Country
    belongs_to :region, Tui.Geo.Region

    timestamps()
  end

  @fields ~w(name name_lat country_id region_id location_id)a
  def changeset(struct, attrs) do
    struct
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
