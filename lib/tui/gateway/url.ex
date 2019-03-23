defmodule Tui.Gateway.Url do
  @baseUrl URI.parse("http://api.tui.ru/export/default.php")

  def build(type), do: build(type, "", %{})
  def build(type, path), do: build(type, path, %{})
  def build(type, path, extra) do
    token = Application.get_env(:tui, :oauth_token)
    base = %{
      samo_action: "reference",
      oauth_token: token,
      type: type,
      laststamp: "0x0000000000000000"
    }
    params = Map.merge(base, extra)
    query = "?" <> URI.encode_query(params)

    @baseUrl
    |> URI.merge(path)
    |> URI.merge(query)
    |> to_string()
  end
end
