defmodule Tui.Travel do
  use Tui.API, :context

  alias Tui.Repo
  alias Tui.Travel.TravelCategory

  def list_travel_categories do
    Repo.all(TravelCategory)
  end

  def get_travel_category!(id), do: Repo.get!(TravelCategory, id)

  def create_travel_category(attrs \\ %{}) do
    %TravelCategory{}
    |> TravelCategory.changeset(attrs)
    |> Repo.insert()
  end

  def update_travel_category(%TravelCategory{} = travel_category, attrs) do
    travel_category
    |> TravelCategory.changeset(attrs)
    |> Repo.update()
  end

  def delete_travel_category(%TravelCategory{} = travel_category) do
    Repo.delete(travel_category)
  end

  def change_travel_category(%TravelCategory{} = travel_category) do
    TravelCategory.changeset(travel_category, %{})
  end
end
