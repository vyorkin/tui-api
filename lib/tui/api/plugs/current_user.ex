defmodule Tui.API.Plug.CurrentUser do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    user = Tui.API.Guardian.Plug.current_resource(conn)
    conn |> assign(:current_user, user)
  end
end
