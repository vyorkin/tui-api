defmodule Tui.API.Plug.Errors do
  import Plug.Conn
  import Phoenix.Controller

  alias Tui.ErrorFormatter

  def unauthorized!(conn, {code, text} \\ Tui.Authorization.Error.unauthenticated()) do
    conn
    |> put_status(401)
    |> json(%{error: "Unauthorized", reason: %{code: code, text: text}})
    |> halt()
  end

  def forbidden!(conn) do
    conn
    |> put_status(403)
    |> json(%{error: "Forbidden"})
    |> halt()
  end

  def not_found!(conn) do
    conn
    |> put_status(404)
    |> json(%{error: "Not Found"})
    |> halt()
  end

  def domain_error(conn, error) do
    conn
    |> put_status(422)
    |> json(%{error: error})
  end

  def changeset_error(conn, changeset) do
    errors = ErrorFormatter.changeset_errors(changeset)
    errors =
      for {field, {message, _}} <- errors, into: %{} do
        {field, message}
      end

    conn
    |> put_status(422)
    |> json(%{errors: errors})
  end
end
