defmodule Tui.API.V1.HotelView do
  use Tui.API, :view

  @attrs [
    :id, :name,
    :inserted_at, :updated_at
  ]

  def render("index.json", %{hotels: hotels}) do
    render_many(hotels, __MODULE__, "show.json")
  end

  def render("show.json", %{hotel: hotel}) do
    hotel
    |> Map.take(@attrs)
    |> Map.put(:deleted, !is_nil(hotel.deleted_at))
  end
end
