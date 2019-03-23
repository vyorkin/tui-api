defmodule Tui.Travel.TravelCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "travel_categories" do
    field :name, :string
    field :deleted_at, :naive_datetime

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
