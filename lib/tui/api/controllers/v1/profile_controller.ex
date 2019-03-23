defmodule Tui.API.V1.ProfileController do
  use Tui.API, :controller

  # import Tui.API.Plug.Auth

  alias Tui.Auth

  def index(conn, _params) do
    users = Auth.list_users()
    conn |> render(:index, %{users: users})
  end

  def show(conn, _params) do
    conn |> render(:show, %{user: conn.assigns.current_user})
  end
end
