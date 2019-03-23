defmodule Tui.Auth.User do
  use Tui.API, :model

  schema "users" do
    field :email, :string
    field :name, :string
    field :avatar, :string
    field :tags, {:array, :string}
    field :password_hash, :string
    field :deleted_at, :naive_datetime

    timestamps()
  end

  @fields ~w(name tags)a
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @fields)
    |> unique_constraint(:email)
  end
end
