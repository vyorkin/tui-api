defmodule Tui.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def up do
    create table(:cities) do
      add :name, :string
      add :name_lat, :string
      add :region_id, references(:regions, on_delete: :nothing)
      add :country_id, references(:countries, on_delete: :nothing)
      add :location_id, references(:locations, on_delete: :nothing)
      add :deleted_at, :naive_datetime

      timestamps()
    end

    create index(:cities, [:region_id])
    create index(:cities, [:country_id])
  end

  def down do
    drop table(:cities)
  end
end
