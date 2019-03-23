defmodule Tui.Gateway.Url do
  @baseUrl URI.parse("http://api.tui.ru/export/default.php")

  def build(opts) do
    token = Application.get_env(:tui, :oauth_token)
    base = %{
      oauth_token: token,
      laststamp: "0x0000000000000000"
    }
    params = Map.merge(base, opts)
    query = "?" <> URI.encode_query(params)

    @baseUrl
    |> URI.merge(query)
    |> to_string()
  end
end
