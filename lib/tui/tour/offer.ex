defmodule Tui.Tour.Offer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tour_offers" do
    field :data, :map

    timestamps()
  end

  @doc false
  def changeset(offer, attrs) do
    offer
    |> cast(attrs, [:data])
    |> validate_required([:data])
  end
end
