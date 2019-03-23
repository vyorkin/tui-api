defmodule Tui.Geo.Region do
  use Tui.API, :model

  alias Tui.Geo.{Country, City}

  schema "regions" do
    field :name, :string
    field :name_lat, :string
    field :deleted_at, :naive_datetime

    belongs_to :country, Country
    has_many :cities, City

    timestamps()
  end

  @fields ~w(name name_lat country_id)a
  def changeset(struct, attrs) do
    struct
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
