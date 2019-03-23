defmodule Tui.Travel.TravelCategory do
  use Tui.API, :model

  alias Tui.Geo.Country
  alias Tui.Travel.TravelCountry

  schema "travel_categories" do
    field :name, :string
    field :deleted_at, :naive_datetime

    many_to_many :countries, Country,
      join_through: TravelCountry

    timestamps()
  end

  @fields ~w(name)a
  def changeset(struct, attrs) do
    struct
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> unique_constraint(:name)
  end
end
