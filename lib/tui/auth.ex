defmodule Tui.Auth do
  use Tui.API, :context

  alias Tui.Repo
  alias Tui.Auth.User

  def list_users do
    Repo.all(User)
  end

  def get_user!(id) do
    query =
      from u in User,
      where: u.id == ^id and is_nil(u.deleted_at)

    Repo.one(query)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end
