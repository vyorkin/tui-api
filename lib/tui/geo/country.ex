defmodule Tui.Geo.Country do
  use Tui.API, :model

  alias Tui.Geo.{City, Region, Location}
  alias Tui.Travel.{TravelCategory, TravelCountry}

  schema "countries" do
    field :name, :string
    field :name_lat, :string
    field :deleted_at, :naive_datetime

    belongs_to :location, Location

    has_many :regions, Region
    has_many :cities, City

    many_to_many :travel_categories, TravelCategory,
      join_through: TravelCountry

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
