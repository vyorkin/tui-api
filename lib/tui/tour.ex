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

  alias Tui.Tour.Offer

  @doc """
  Returns the list of tour_offers.

  ## Examples

      iex> list_tour_offers()
      [%Offer{}, ...]

  """
  def list_tour_offers do
    Repo.all(Offer)
  end

  @doc """
  Gets a single offer.

  Raises `Ecto.NoResultsError` if the Offer does not exist.

  ## Examples

      iex> get_offer!(123)
      %Offer{}

      iex> get_offer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_offer!(id), do: Repo.get!(Offer, id)

  @doc """
  Creates a offer.

  ## Examples

      iex> create_offer(%{field: value})
      {:ok, %Offer{}}

      iex> create_offer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_offer(attrs \\ %{}) do
    %Offer{}
    |> Offer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a offer.

  ## Examples

      iex> update_offer(offer, %{field: new_value})
      {:ok, %Offer{}}

      iex> update_offer(offer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_offer(%Offer{} = offer, attrs) do
    offer
    |> Offer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Offer.

  ## Examples

      iex> delete_offer(offer)
      {:ok, %Offer{}}

      iex> delete_offer(offer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_offer(%Offer{} = offer) do
    Repo.delete(offer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking offer changes.

  ## Examples

      iex> change_offer(offer)
      %Ecto.Changeset{source: %Offer{}}

  """
  def change_offer(%Offer{} = offer) do
    Offer.changeset(offer, %{})
  end
end
