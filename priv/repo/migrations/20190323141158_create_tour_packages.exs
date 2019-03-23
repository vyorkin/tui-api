defmodule Tui.Repo.Migrations.CreateTourPackages do
  use Ecto.Migration

  def change do
    create table(:tour_packages) do
      add :price, :decimal
      add :spo_id, :integer
      add :currency, :integer
      add :people_count, :integer
      add :hotel_id, :integer
      add :accomodation_id, :integer
      add :meal_id, :integer
      add :date_out, :date
      add :room_type_id, :integer
      add :adult_count, :integer
      add :children_count, :integer
      add :packet_type, :integer
      add :price_type, :integer
      add :duration, :integer

      add :searchable, :boolean, default: true, null: false
      add :tour_offer_id, references(:tour_offers, on_delete: :nothing)

      timestamps()
    end

    create index(:tour_packages, [:tour_offer_id])
  end
end
