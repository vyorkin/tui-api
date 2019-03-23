defmodule Tui.Geo.Country do
  use Tui.API, :model

  schema "countries" do
    field :name, :string
    field :name_lat, :string
    field :deleted_at, :naive_datetime

    belongs_to :location, Tui.Geo.Location

    has_many :regions, Tui.Geo.Region
    has_many :cities, Tui.Geo.City

    timestamps()
  end

  @fields ~w(name name_lat location_id)a
  def changeset(struct, attrs) do
    struct
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> unique_constraint(:name)
    |> unique_constraint(:name_lat)
  end
end
