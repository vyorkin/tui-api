defmodule Tui.Repo.Migrations.CreateTravelCategories do
  use Ecto.Migration

  def up do
    create table(:travel_categories) do
      add :name, :string, null: false
      add :deleted_at, :naive_datetime

      timestamps()
    end

    create unique_index(:travel_categories, [:name])
  end

  def down do
    drop table(:travel_categories)
  end
end
