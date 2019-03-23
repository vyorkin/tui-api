defmodule Tui.Travel.TravelCountry do
  use Tui.API, :model

  alias Tui.Geo.Country
  alias Tui.Travel.TravelCategory

  @primary_key false
  schema "travel_countries" do
    field :month, :integer
    field :season, :integer

    belongs_to :country, Country, primary_key: true
    belongs_to :travel_category, TravelCategory, primary_key: true

    timestamps(updated_at: false)
  end

  @fields ~w(country_id travel_category_id month season)a
  def changeset(struct, attrs) do
    struct
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
