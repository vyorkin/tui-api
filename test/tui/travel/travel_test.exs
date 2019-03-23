defmodule Tui.TravelTest do
  use Tui.DataCase

  alias Tui.Travel

  describe "travel_categories" do
    alias Tui.Travel.TravelCategory

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def travel_category_fixture(attrs \\ %{}) do
      {:ok, travel_category} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Travel.create_travel_category()

      travel_category
    end

    test "list_travel_categories/0 returns all travel_categories" do
      travel_category = travel_category_fixture()
      assert Travel.list_travel_categories() == [travel_category]
    end

    test "get_travel_category!/1 returns the travel_category with given id" do
      travel_category = travel_category_fixture()
      assert Travel.get_travel_category!(travel_category.id) == travel_category
    end

    test "create_travel_category/1 with valid data creates a travel_category" do
      assert {:ok, %TravelCategory{} = travel_category} = Travel.create_travel_category(@valid_attrs)
      assert travel_category.name == "some name"
    end

    test "create_travel_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Travel.create_travel_category(@invalid_attrs)
    end

    test "update_travel_category/2 with valid data updates the travel_category" do
      travel_category = travel_category_fixture()
      assert {:ok, %TravelCategory{} = travel_category} = Travel.update_travel_category(travel_category, @update_attrs)
      assert travel_category.name == "some updated name"
    end

    test "update_travel_category/2 with invalid data returns error changeset" do
      travel_category = travel_category_fixture()
      assert {:error, %Ecto.Changeset{}} = Travel.update_travel_category(travel_category, @invalid_attrs)
      assert travel_category == Travel.get_travel_category!(travel_category.id)
    end

    test "delete_travel_category/1 deletes the travel_category" do
      travel_category = travel_category_fixture()
      assert {:ok, %TravelCategory{}} = Travel.delete_travel_category(travel_category)
      assert_raise Ecto.NoResultsError, fn -> Travel.get_travel_category!(travel_category.id) end
    end

    test "change_travel_category/1 returns a travel_category changeset" do
      travel_category = travel_category_fixture()
      assert %Ecto.Changeset{} = Travel.change_travel_category(travel_category)
    end
  end

  describe "travel_countries" do
    alias Tui.Travel.TravelCountry

    @valid_attrs %{month: 42, season: 42}
    @update_attrs %{month: 43, season: 43}
    @invalid_attrs %{month: nil, season: nil}

    def travel_country_fixture(attrs \\ %{}) do
      {:ok, travel_country} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Travel.create_travel_country()

      travel_country
    end

    test "list_travel_countries/0 returns all travel_countries" do
      travel_country = travel_country_fixture()
      assert Travel.list_travel_countries() == [travel_country]
    end

    test "get_travel_country!/1 returns the travel_country with given id" do
      travel_country = travel_country_fixture()
      assert Travel.get_travel_country!(travel_country.id) == travel_country
    end

    test "create_travel_country/1 with valid data creates a travel_country" do
      assert {:ok, %TravelCountry{} = travel_country} = Travel.create_travel_country(@valid_attrs)
      assert travel_country.month == 42
      assert travel_country.season == 42
    end

    test "create_travel_country/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Travel.create_travel_country(@invalid_attrs)
    end

    test "update_travel_country/2 with valid data updates the travel_country" do
      travel_country = travel_country_fixture()
      assert {:ok, %TravelCountry{} = travel_country} = Travel.update_travel_country(travel_country, @update_attrs)
      assert travel_country.month == 43
      assert travel_country.season == 43
    end

    test "update_travel_country/2 with invalid data returns error changeset" do
      travel_country = travel_country_fixture()
      assert {:error, %Ecto.Changeset{}} = Travel.update_travel_country(travel_country, @invalid_attrs)
      assert travel_country == Travel.get_travel_country!(travel_country.id)
    end

    test "delete_travel_country/1 deletes the travel_country" do
      travel_country = travel_country_fixture()
      assert {:ok, %TravelCountry{}} = Travel.delete_travel_country(travel_country)
      assert_raise Ecto.NoResultsError, fn -> Travel.get_travel_country!(travel_country.id) end
    end

    test "change_travel_country/1 returns a travel_country changeset" do
      travel_country = travel_country_fixture()
      assert %Ecto.Changeset{} = Travel.change_travel_country(travel_country)
    end
  end
end
