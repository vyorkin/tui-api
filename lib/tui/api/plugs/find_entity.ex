defmodule Tui.API.Plug.FindEntity do
  import Plug.Conn
  import Ecto.Query, only: [from: 2, dynamic: 2]

  def init(opts), do: opts

  def call(conn, opts) do
    id = conn.params[opts[:param]]
    preload = opts[:preload] || []

    query =
      from u in opts[:entity],
      where: u.id == ^id,
      where: ^not_deleted(opts[:exclude_deleted]),
      preload: ^preload

    case Tui.Repo.one(query) do
      nil -> conn |> Tui.API.Plug.Errors.not_found!()
      entity -> conn |> assign(opts[:key], entity)
    end
  end

  defp not_deleted(false), do: true
  defp not_deleted(true), do: dynamic([e], is_nil(e.deleted_at))
end
