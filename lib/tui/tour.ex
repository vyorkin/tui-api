defmodule Tui.Tour do
  use Tui.API, :context

  alias Tui.Repo
  alias Tui.Tour.{HotelAttribute, Hotel, Offer}

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


  def list_tour_offers(country) do
    query =
      from o in Offer,
      where: o.country_id == ^country.id

    query |> Repo.all()
  end

  def get_offer!(id), do: Repo.get!(Offer, id)

  def create_offer!(attrs \\ %{}) do
    %Offer{}
    |> Offer.changeset(attrs)
    |> Repo.insert!()
  end

  def update_offer(%Offer{} = offer, attrs) do
    offer
    |> Offer.changeset(attrs)
    |> Repo.update()
  end

  def delete_offer(%Offer{} = offer) do
    Repo.delete(offer)
  end

  def change_offer(%Offer{} = offer) do
    Offer.changeset(offer, %{})
  end

  alias Tui.Tour.Package

  @doc """
  Returns the list of tour_packages.

  ## Examples

      iex> list_tour_packages()
      [%Package{}, ...]

  """
  def list_tour_packages do
    Repo.all(Package)
  end

  @doc """
  Gets a single package.

  Raises `Ecto.NoResultsError` if the Package does not exist.

  ## Examples

      iex> get_package!(123)
      %Package{}

      iex> get_package!(456)
      ** (Ecto.NoResultsError)

  """
  def get_package!(id), do: Repo.get!(Package, id)

  @doc """
  Creates a package.

  ## Examples

      iex> create_package(%{field: value})
      {:ok, %Package{}}

      iex> create_package(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_package(attrs \\ %{}) do
    %Package{}
    |> Package.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a package.

  ## Examples

      iex> update_package(package, %{field: new_value})
      {:ok, %Package{}}

      iex> update_package(package, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_package(%Package{} = package, attrs) do
    package
    |> Package.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Package.

  ## Examples

      iex> delete_package(package)
      {:ok, %Package{}}

      iex> delete_package(package)
      {:error, %Ecto.Changeset{}}

  """
  def delete_package(%Package{} = package) do
    Repo.delete(package)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking package changes.

  ## Examples

      iex> change_package(package)
      %Ecto.Changeset{source: %Package{}}

  """
  def change_package(%Package{} = package) do
    Package.changeset(package, %{})
  end
end
