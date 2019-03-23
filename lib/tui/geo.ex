defmodule Tui.Geo do
  use Tui.API, :context

  alias Tui.Repo
  alias Tui.Geo.{Country, Region, City}

  def list_countries do
    query =
      from c in Country,
      where: is_nil(c.deleted_at),
      order_by: c.name,
      preload: [:location, cities: [:location]]

    query |> Repo.all()
  end

  def get_country!(id), do: Repo.get!(Country, id)

  def create_country(attrs \\ %{}) do
    %Country{}
    |> Country.changeset(attrs)
    |> Repo.insert()
  end

  def update_country(%Country{} = country, attrs) do
    country
    |> Country.changeset(attrs)
    |> Repo.update()
  end

  def delete_country(%Country{} = country) do
    Repo.delete(country)
  end

  def change_country(%Country{} = country) do
    Country.changeset(country, %{})
  end

  def list_regions do
    Repo.all(Region)
  end

  def get_region!(id), do: Repo.get!(Region, id)

  def create_region(attrs \\ %{}) do
    %Region{}
    |> Region.changeset(attrs)
    |> Repo.insert()
  end

  def update_region(%Region{} = region, attrs) do
    region
    |> Region.changeset(attrs)
    |> Repo.update()
  end

  def delete_region(%Region{} = region) do
    Repo.delete(region)
  end

  def change_region(%Region{} = region) do
    Region.changeset(region, %{})
  end

  def list_cities() do
    query =
      from c in City,
      where: is_nil(c.deleted_at),
      order_by: c.name,
      preload: [:location]

    query |> Repo.all()
  end

  def country_cities(country) do
    query =
      from c in City,
      where:
        c.country_id == ^country.id and
        is_nil(c.deleted_at),
      order_by: c.name,
      preload: [:location]

    query |> Repo.all()
  end

  def get_city!(id), do: Repo.get!(City, id)

  def create_city(attrs \\ %{}) do
    %City{}
    |> City.changeset(attrs)
    |> Repo.insert()
  end

  def update_city(%City{} = city, attrs) do
    city
    |> City.changeset(attrs)
    |> Repo.update()
  end

  def delete_city(%City{} = city) do
    Repo.delete(city)
  end

  def change_city(%City{} = city) do
    City.changeset(city, %{})
  end
end
