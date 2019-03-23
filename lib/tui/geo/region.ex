defmodule Tui.Geo.Region do
  use Tui.API, :model

  schema "regions" do
    field :name, :string
    field :name_lat, :string
    field :deleted_at, :naive_datetime

    belongs_to :country, Tui.Country
    has_many :cities, Tui.City

    timestamps()
  end

  @fields ~w(name name_lat country_id)a
  def changeset(struct, attrs) do
    struct
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
