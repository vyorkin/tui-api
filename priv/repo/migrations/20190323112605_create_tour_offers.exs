defmodule Tui.Repo.Migrations.CreateTourOffers do
  use Ecto.Migration

  def change do
    create table(:tour_offers) do
      add :country_id, references(:countries, on_delete: :nothing)
      add :data, :map

      timestamps()
    end

  end
end
