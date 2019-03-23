defmodule Tui.Tour do
  use Tui.API, :context

  alias Tui.Repo
  alias Tui.Tour.Hotel

  def list_hotels do
    Repo.all(Hotel)
  end

  def get_hotel!(id), do: Repo.get!(Hotel, id)

  def create_hotel(attrs \\ %{}) do
    %Hotel{}
    |> Hotel.changeset(attrs)
    |> Repo.insert()
  end

  def update_hotel(%Hotel{} = hotel, attrs) do
    hotel
    |> Hotel.changeset(attrs)
    |> Repo.update()
  end

  def delete_hotel(%Hotel{} = hotel) do
    Repo.delete(hotel)
  end

  def change_hotel(%Hotel{} = hotel) do
    Hotel.changeset(hotel, %{})
  end

  alias Tui.Tour.HotelAttribute

  def list_hotel_attributes do
    Repo.all(HotelAttribute)
  end

  def get_hotel_attribute!(id), do: Repo.get!(HotelAttribute, id)

  def create_hotel_attribute(attrs \\ %{}) do
    %HotelAttribute{}
    |> HotelAttribute.changeset(attrs)
    |> Repo.insert()
  end

  def update_hotel_attribute(%HotelAttribute{} = hotel_attribute, attrs) do
    hotel_attribute
    |> HotelAttribute.changeset(attrs)
    |> Repo.update()
  end

  def delete_hotel_attribute(%HotelAttribute{} = hotel_attribute) do
    Repo.delete(hotel_attribute)
  end

  def change_hotel_attribute(%HotelAttribute{} = hotel_attribute) do
    HotelAttribute.changeset(hotel_attribute, %{})
  end
end
