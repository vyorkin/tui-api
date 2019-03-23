defmodule Tui.Tour.Package do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tour_packages" do
    field :accomodation_id, :integer
    field :adult_count, :integer
    field :children_count, :integer
    field :currency, :integer
    field :date_out, :date
    field :duration, :integer
    field :hotel_id, :integer
    field :meal_id, :integer
    field :packet_type, :integer
    field :people_count, :integer
    field :price, :decimal
    field :price_type, :integer
    field :room_type_id, :integer
    field :searchable, :boolean, default: false
    field :spo_id, :integer
    field :tour_offer_id, :id

    timestamps()
  end

  @fields ~w(
    price spo_id currency people_count
    hotel_id accomodation_id meal_id date_out
    room_type_id adult_count children_count
    packet_type price_type duration searchable
  )a
  def changeset(package, attrs) do
    package
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
