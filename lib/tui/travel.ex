defmodule Tui.Travel do
  use Tui.API, :context

  alias Tui.Repo
  alias Tui.Travel.{TravelCategory, TravelCountry}

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

  def list_travel_countries do
    Repo.all(TravelCountry)
  end

  def get_travel_country!(id), do: Repo.get!(TravelCountry, id)

  def create_travel_country(attrs \\ %{}) do
    %TravelCountry{}
    |> TravelCountry.changeset(attrs)
    |> Repo.insert()
  end

  def update_travel_country(%TravelCountry{} = travel_country, attrs) do
    travel_country
    |> TravelCountry.changeset(attrs)
    |> Repo.update()
  end

  def delete_travel_country(%TravelCountry{} = travel_country) do
    Repo.delete(travel_country)
  end

  def change_travel_country(%TravelCountry{} = travel_country) do
    TravelCountry.changeset(travel_country, %{})
  end
end
