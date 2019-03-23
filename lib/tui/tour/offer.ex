defmodule Tui.Tour.Offer do
  use Tui.API, :model

  alias Tui.Geo.Country

  schema "tour_offers" do
    field :data, :map
    belongs_to :country, Country

    timestamps()
  end

  @fields ~w(data country_id)a
  def changeset(offer, attrs) do
    offer
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
