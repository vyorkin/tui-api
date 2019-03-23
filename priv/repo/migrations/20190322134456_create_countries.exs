defmodule Tui.Repo.Migrations.CreateCountries do
  use Ecto.Migration

  def up do
    create table(:countries) do
      add :name, :string
      add :name_lat, :string
      add :deleted_at, :naive_datetime
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:countries, [:name])
    create unique_index(:countries, [:name_lat])
  end

  def down do
    drop table(:countries)
  end
end
