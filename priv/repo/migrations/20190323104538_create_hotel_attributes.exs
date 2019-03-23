defmodule Tui.Repo.Migrations.CreateHotelAttributes do
  use Ecto.Migration

  def change do
    create table(:hotel_attributes) do
      add :name, :string
      add :name_alt, :string
      add :icon, :string
      add :note, :string
      add :count, :integer

      timestamps()
    end
  end
end
