defmodule Tui.Pagination do
  import Ecto.Query

  @limit 20

  def paginate(query, page \\ nil),
    do: paginate(query, page, @limit)

  def paginate(query, page, count) do
    offset = ((page || 1) - 1) * count
    query
    |> offset([_], ^offset)
    |> limit([_], ^count)
  end
end
