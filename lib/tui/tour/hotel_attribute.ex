defmodule Tui.Tour.HotelAttribute do
  use Ecto.Schema
  import Ecto.Changeset

  schema "hotel_attributes" do
    field :count, :integer
    field :icon, :string
    field :name, :string
    field :name_alt, :string
    field :note, :string

    timestamps()
  end

  @fields ~w(name name_alt icon note count)a
  def changeset(struct, attrs) do
    struct
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
