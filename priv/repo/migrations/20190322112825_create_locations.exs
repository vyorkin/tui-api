defmodule Tui.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :citext, null: false
      add :coordinates, :point
      add :deleted_at, :naive_datetime

      timestamps(updated_at: false)
    end
  end
end
