defmodule Tui.API.V1.TourView do
  use Tui.API, :view

  @attrs [
    :id, :name, :hotel_id,
    :inserted_at, :updated_at
  ]

  def render("index.json", %{tours: tours}) do
    render_many(tours, __MODULE__, "show.json")
  end

  def render("show.json", %{tour: tour}) do
    tour
    |> Map.take(@attrs)
    |> Map.put(:deleted, !is_nil(tour.deleted_at))
  end
end
