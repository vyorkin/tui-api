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

  describe "tour_offers" do
    alias Tui.Tour.Offer

    @valid_attrs %{data: %{}}
    @update_attrs %{data: %{}}
    @invalid_attrs %{data: nil}

    def offer_fixture(attrs \\ %{}) do
      {:ok, offer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tour.create_offer()

      offer
    end

    test "list_tour_offers/0 returns all tour_offers" do
      offer = offer_fixture()
      assert Tour.list_tour_offers() == [offer]
    end

    test "get_offer!/1 returns the offer with given id" do
      offer = offer_fixture()
      assert Tour.get_offer!(offer.id) == offer
    end

    test "create_offer/1 with valid data creates a offer" do
      assert {:ok, %Offer{} = offer} = Tour.create_offer(@valid_attrs)
      assert offer.data == %{}
    end

    test "create_offer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tour.create_offer(@invalid_attrs)
    end

    test "update_offer/2 with valid data updates the offer" do
      offer = offer_fixture()
      assert {:ok, %Offer{} = offer} = Tour.update_offer(offer, @update_attrs)
      assert offer.data == %{}
    end

    test "update_offer/2 with invalid data returns error changeset" do
      offer = offer_fixture()
      assert {:error, %Ecto.Changeset{}} = Tour.update_offer(offer, @invalid_attrs)
      assert offer == Tour.get_offer!(offer.id)
    end

    test "delete_offer/1 deletes the offer" do
      offer = offer_fixture()
      assert {:ok, %Offer{}} = Tour.delete_offer(offer)
      assert_raise Ecto.NoResultsError, fn -> Tour.get_offer!(offer.id) end
    end

    test "change_offer/1 returns a offer changeset" do
      offer = offer_fixture()
      assert %Ecto.Changeset{} = Tour.change_offer(offer)
    end
  end

  describe "tour_packages" do
    alias Tui.Tour.Package

    @valid_attrs %{accomodation_id: 42, adult_count: 42, children_count: 42, currency: 42, date_out: ~D[2010-04-17], duration: 42, hotel_id: 42, meal_id: 42, packet_type: 42, people_count: 42, price: "120.5", price_type: 42, room_type_id: 42, searchable: true, spo_id: 42}
    @update_attrs %{accomodation_id: 43, adult_count: 43, children_count: 43, currency: 43, date_out: ~D[2011-05-18], duration: 43, hotel_id: 43, meal_id: 43, packet_type: 43, people_count: 43, price: "456.7", price_type: 43, room_type_id: 43, searchable: false, spo_id: 43}
    @invalid_attrs %{accomodation_id: nil, adult_count: nil, children_count: nil, currency: nil, date_out: nil, duration: nil, hotel_id: nil, meal_id: nil, packet_type: nil, people_count: nil, price: nil, price_type: nil, room_type_id: nil, searchable: nil, spo_id: nil}

    def package_fixture(attrs \\ %{}) do
      {:ok, package} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tour.create_package()

      package
    end

    test "list_tour_packages/0 returns all tour_packages" do
      package = package_fixture()
      assert Tour.list_tour_packages() == [package]
    end

    test "get_package!/1 returns the package with given id" do
      package = package_fixture()
      assert Tour.get_package!(package.id) == package
    end

    test "create_package/1 with valid data creates a package" do
      assert {:ok, %Package{} = package} = Tour.create_package(@valid_attrs)
      assert package.accomodation_id == 42
      assert package.adult_count == 42
      assert package.children_count == 42
      assert package.currency == 42
      assert package.date_out == ~D[2010-04-17]
      assert package.duration == 42
      assert package.hotel_id == 42
      assert package.meal_id == 42
      assert package.packet_type == 42
      assert package.people_count == 42
      assert package.price == Decimal.new("120.5")
      assert package.price_type == 42
      assert package.room_type_id == 42
      assert package.searchable == true
      assert package.spo_id == 42
    end

    test "create_package/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tour.create_package(@invalid_attrs)
    end

    test "update_package/2 with valid data updates the package" do
      package = package_fixture()
      assert {:ok, %Package{} = package} = Tour.update_package(package, @update_attrs)
      assert package.accomodation_id == 43
      assert package.adult_count == 43
      assert package.children_count == 43
      assert package.currency == 43
      assert package.date_out == ~D[2011-05-18]
      assert package.duration == 43
      assert package.hotel_id == 43
      assert package.meal_id == 43
      assert package.packet_type == 43
      assert package.people_count == 43
      assert package.price == Decimal.new("456.7")
      assert package.price_type == 43
      assert package.room_type_id == 43
      assert package.searchable == false
      assert package.spo_id == 43
    end

    test "update_package/2 with invalid data returns error changeset" do
      package = package_fixture()
      assert {:error, %Ecto.Changeset{}} = Tour.update_package(package, @invalid_attrs)
      assert package == Tour.get_package!(package.id)
    end

    test "delete_package/1 deletes the package" do
      package = package_fixture()
      assert {:ok, %Package{}} = Tour.delete_package(package)
      assert_raise Ecto.NoResultsError, fn -> Tour.get_package!(package.id) end
    end

    test "change_package/1 returns a package changeset" do
      package = package_fixture()
      assert %Ecto.Changeset{} = Tour.change_package(package)
    end
  end
end
