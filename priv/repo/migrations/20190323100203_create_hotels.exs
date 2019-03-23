defmodule Tui.Repo.Migrations.CreateHotels do
  use Ecto.Migration

  def change do
    create table(:hotels) do
      add :name, :string

      timestamps()
    end
  end
end
