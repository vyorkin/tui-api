defmodule Tui.API.V1.ProfileView do
  use Tui.API, :view

  @attrs [
    :id, :name, :avatar, :tags,
    :inserted_at, :updated_at
  ]

  def render("index.json", %{users: users}) do
    render_many(users, __MODULE__, "show.json")
  end

  def render("show.json", %{user: user}) do
    user
    |> Map.take(@attrs)
    |> Map.put(:deleted, !is_nil(user.deleted_at))
  end
end
