defmodule Tui.GeoTest do
  use Tui.DataCase

  alias Tui.Geo

  describe "countries" do
    alias Tui.Geo.Country

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def country_fixture(attrs \\ %{}) do
      {:ok, country} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geo.create_country()

      country
    end

    test "list_countries/0 returns all countries" do
      country = country_fixture()
      assert Geo.list_countries() == [country]
    end

    test "get_country!/1 returns the country with given id" do
      country = country_fixture()
      assert Geo.get_country!(country.id) == country
    end

    test "create_country/1 with valid data creates a country" do
      assert {:ok, %Country{} = country} = Geo.create_country(@valid_attrs)
      assert country.name == "some name"
    end

    test "create_country/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geo.create_country(@invalid_attrs)
    end

    test "update_country/2 with valid data updates the country" do
      country = country_fixture()
      assert {:ok, %Country{} = country} = Geo.update_country(country, @update_attrs)
      assert country.name == "some updated name"
    end

    test "update_country/2 with invalid data returns error changeset" do
      country = country_fixture()
      assert {:error, %Ecto.Changeset{}} = Geo.update_country(country, @invalid_attrs)
      assert country == Geo.get_country!(country.id)
    end

    test "delete_country/1 deletes the country" do
      country = country_fixture()
      assert {:ok, %Country{}} = Geo.delete_country(country)
      assert_raise Ecto.NoResultsError, fn -> Geo.get_country!(country.id) end
    end

    test "change_country/1 returns a country changeset" do
      country = country_fixture()
      assert %Ecto.Changeset{} = Geo.change_country(country)
    end
  end

  describe "regions" do
    alias Tui.Geo.Region

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def region_fixture(attrs \\ %{}) do
      {:ok, region} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geo.create_region()

      region
    end

    test "list_regions/0 returns all regions" do
      region = region_fixture()
      assert Geo.list_regions() == [region]
    end

    test "get_region!/1 returns the region with given id" do
      region = region_fixture()
      assert Geo.get_region!(region.id) == region
    end

    test "create_region/1 with valid data creates a region" do
      assert {:ok, %Region{} = region} = Geo.create_region(@valid_attrs)
      assert region.name == "some name"
    end

    test "create_region/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geo.create_region(@invalid_attrs)
    end

    test "update_region/2 with valid data updates the region" do
      region = region_fixture()
      assert {:ok, %Region{} = region} = Geo.update_region(region, @update_attrs)
      assert region.name == "some updated name"
    end

    test "update_region/2 with invalid data returns error changeset" do
      region = region_fixture()
      assert {:error, %Ecto.Changeset{}} = Geo.update_region(region, @invalid_attrs)
      assert region == Geo.get_region!(region.id)
    end

    test "delete_region/1 deletes the region" do
      region = region_fixture()
      assert {:ok, %Region{}} = Geo.delete_region(region)
      assert_raise Ecto.NoResultsError, fn -> Geo.get_region!(region.id) end
    end

    test "change_region/1 returns a region changeset" do
      region = region_fixture()
      assert %Ecto.Changeset{} = Geo.change_region(region)
    end
  end

  describe "cities" do
    alias Tui.Geo.City

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def city_fixture(attrs \\ %{}) do
      {:ok, city} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geo.create_city()

      city
    end

    test "list_cities/0 returns all cities" do
      city = city_fixture()
      assert Geo.list_cities() == [city]
    end

    test "get_city!/1 returns the city with given id" do
      city = city_fixture()
      assert Geo.get_city!(city.id) == city
    end

    test "create_city/1 with valid data creates a city" do
      assert {:ok, %City{} = city} = Geo.create_city(@valid_attrs)
      assert city.name == "some name"
    end

    test "create_city/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geo.create_city(@invalid_attrs)
    end

    test "update_city/2 with valid data updates the city" do
      city = city_fixture()
      assert {:ok, %City{} = city} = Geo.update_city(city, @update_attrs)
      assert city.name == "some updated name"
    end

    test "update_city/2 with invalid data returns error changeset" do
      city = city_fixture()
      assert {:error, %Ecto.Changeset{}} = Geo.update_city(city, @invalid_attrs)
      assert city == Geo.get_city!(city.id)
    end

    test "delete_city/1 deletes the city" do
      city = city_fixture()
      assert {:ok, %City{}} = Geo.delete_city(city)
      assert_raise Ecto.NoResultsError, fn -> Geo.get_city!(city.id) end
    end

    test "change_city/1 returns a city changeset" do
      city = city_fixture()
      assert %Ecto.Changeset{} = Geo.change_city(city)
    end
  end

  describe "locations" do
    alias Tui.Geo.Location

    @valid_attrs %{coordinates: 42}
    @update_attrs %{coordinates: 43}
    @invalid_attrs %{coordinates: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Geo.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Geo.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Geo.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = Geo.create_location(@valid_attrs)
      assert location.coordinates == 42
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Geo.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, %Location{} = location} = Geo.update_location(location, @update_attrs)
      assert location.coordinates == 43
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Geo.update_location(location, @invalid_attrs)
      assert location == Geo.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Geo.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Geo.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Geo.change_location(location)
    end
  end
end
