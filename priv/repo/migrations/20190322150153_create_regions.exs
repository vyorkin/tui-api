defmodule Tui.Repo.Migrations.CreateRegions do
  use Ecto.Migration

  def up do
    create table(:regions) do
      add :name, :string
      add :name_lat, :string
      add :country_id, references(:countries, on_delete: :nothing)
      add :deleted_at, :naive_datetime

      timestamps()
    end

    create index(:regions, [:country_id])
  end

  def down do
    drop table(:regions)
  end
end
