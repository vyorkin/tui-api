defmodule Tui.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    execute "CREATE EXTENSION IF NOT EXISTS citext"

    create table(:users) do
      add :email, :string, null: false
      add :name, :citext, null: false
      add :avatar, :string
      add :password_hash, :string
      add :tags, {:array, :string}
      add :deleted_at, :naive_datetime

      timestamps()
    end

    create unique_index(:users, [:email])
  end

  def down do
    drop table(:users)
  end
end
