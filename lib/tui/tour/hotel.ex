defmodule Tui.Tour.Hotel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hotels" do
    field :name, :string

    timestamps()
  end

  @fields ~w(name)a
  def changeset(hotel, attrs) do
    hotel
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
