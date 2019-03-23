defmodule Tui.TourTest do
  use Tui.DataCase

  alias Tui.Tour

  describe "hotels" do
    alias Tui.Tour.Hotel

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def hotel_fixture(attrs \\ %{}) do
      {:ok, hotel} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tour.create_hotel()

      hotel
    end

    test "list_hotels/0 returns all hotels" do
      hotel = hotel_fixture()
      assert Tour.list_hotels() == [hotel]
    end

    test "get_hotel!/1 returns the hotel with given id" do
      hotel = hotel_fixture()
      assert Tour.get_hotel!(hotel.id) == hotel
    end

    test "create_hotel/1 with valid data creates a hotel" do
      assert {:ok, %Hotel{} = hotel} = Tour.create_hotel(@valid_attrs)
    end

    test "create_hotel/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tour.create_hotel(@invalid_attrs)
    end

    test "update_hotel/2 with valid data updates the hotel" do
      hotel = hotel_fixture()
      assert {:ok, %Hotel{} = hotel} = Tour.update_hotel(hotel, @update_attrs)
    end

    test "update_hotel/2 with invalid data returns error changeset" do
      hotel = hotel_fixture()
      assert {:error, %Ecto.Changeset{}} = Tour.update_hotel(hotel, @invalid_attrs)
      assert hotel == Tour.get_hotel!(hotel.id)
    end

    test "delete_hotel/1 deletes the hotel" do
      hotel = hotel_fixture()
      assert {:ok, %Hotel{}} = Tour.delete_hotel(hotel)
      assert_raise Ecto.NoResultsError, fn -> Tour.get_hotel!(hotel.id) end
    end

    test "change_hotel/1 returns a hotel changeset" do
      hotel = hotel_fixture()
      assert %Ecto.Changeset{} = Tour.change_hotel(hotel)
    end
  end

  describe "hotel_attributes" do
    alias Tui.Tour.HotelAttribute

    @valid_attrs %{count: 42, icon: "some icon", name: "some name", name_alt: "some name_alt", note: "some note"}
    @update_attrs %{count: 43, icon: "some updated icon", name: "some updated name", name_alt: "some updated name_alt", note: "some updated note"}
    @invalid_attrs %{count: nil, icon: nil, name: nil, name_alt: nil, note: nil}

    def hotel_attribute_fixture(attrs \\ %{}) do
      {:ok, hotel_attribute} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tour.create_hotel_attribute()

      hotel_attribute
    end

    test "list_hotel_attributes/0 returns all hotel_attributes" do
      hotel_attribute = hotel_attribute_fixture()
      assert Tour.list_hotel_attributes() == [hotel_attribute]
    end

    test "get_hotel_attribute!/1 returns the hotel_attribute with given id" do
      hotel_attribute = hotel_attribute_fixture()
      assert Tour.get_hotel_attribute!(hotel_attribute.id) == hotel_attribute
    end

    test "create_hotel_attribute/1 with valid data creates a hotel_attribute" do
      assert {:ok, %HotelAttribute{} = hotel_attribute} = Tour.create_hotel_attribute(@valid_attrs)
      assert hotel_attribute.count == 42
      assert hotel_attribute.icon == "some icon"
      assert hotel_attribute.name == "some name"
      assert hotel_attribute.name_alt == "some name_alt"
      assert hotel_attribute.note == "some note"
    end

    test "create_hotel_attribute/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tour.create_hotel_attribute(@invalid_attrs)
    end

    test "update_hotel_attribute/2 with valid data updates the hotel_attribute" do
      hotel_attribute = hotel_attribute_fixture()
      assert {:ok, %HotelAttribute{} = hotel_attribute} = Tour.update_hotel_attribute(hotel_attribute, @update_attrs)
      assert hotel_attribute.count == 43
      assert hotel_attribute.icon == "some updated icon"
      assert hotel_attribute.name == "some updated name"
      assert hotel_attribute.name_alt == "some updated name_alt"
      assert hotel_attribute.note == "some updated note"
    end

    test "update_hotel_attribute/2 with invalid data returns error changeset" do
      hotel_attribute = hotel_attribute_fixture()
      assert {:error, %Ecto.Changeset{}} = Tour.update_hotel_attribute(hotel_attribute, @invalid_attrs)
      assert hotel_attribute == Tour.get_hotel_attribute!(hotel_attribute.id)
    end

    test "delete_hotel_attribute/1 deletes the hotel_attribute" do
      hotel_attribute = hotel_attribute_fixture()
      assert {:ok, %HotelAttribute{}} = Tour.delete_hotel_attribute(hotel_attribute)
      assert_raise Ecto.NoResultsError, fn -> Tour.get_hotel_attribute!(hotel_attribute.id) end
    end

    test "change_hotel_attribute/1 returns a hotel_attribute changeset" do
      hotel_attribute = hotel_attribute_fixture()
      assert %Ecto.Changeset{} = Tour.change_hotel_attribute(hotel_attribute)
    end
  end
end
