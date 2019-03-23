defmodule Tui.Repo.Migrations.CreateTravelCountries do
  use Ecto.Migration

  def change do
    create table(:travel_countries, primary_key: false) do
      add :country_id, references(:countries, on_delete: :nothing)
      add :travel_category_id, references(:travel_categories, on_delete: :nothing)

      add :month, :integer
      add :season, :integer

      timestamps(updated_at: false)
    end
 
    create unique_index(:travel_countries, [:country_id, :travel_category_id])
    create index(:travel_countries, [:country_id])
    create index(:travel_countries, [:travel_category_id])
  end
end
