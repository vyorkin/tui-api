defmodule Tui.API.Plug.Auth do
  def logout(conn) do
    jwt = Tui.API.Guardian.Plug.current_token(conn)
    {:ok, claims} = Tui.API.Guardian.Plug.claims(conn)
    Tui.API.Guardian.Plug.revoke!(jwt, claims)
    conn
  end
end
