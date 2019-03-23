defmodule Tui.API.V1.TravelCategoryView do
  use Tui.API, :view

  @attrs [
    :id, :name,
    :inserted_at, :updated_at
  ]

  def render("index.json", %{travel_categories: travel_categories}) do
    render_many(travel_categories, __MODULE__, "show.json")
  end

  def render("show.json", %{travel_category: travel_category}) do
    travel_category
    |> Map.take(@attrs)
    |> Map.put(:deleted, !is_nil(travel_category.deleted_at))
  end
end
