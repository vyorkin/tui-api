defmodule Tui.API.Endpoint do
  use Phoenix.Endpoint, otp_app: :tui

  plug Plug.Static, at: "/", from: :tui, only: ~w(apiary.apib)

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library(),
    length: 900_000_000,     # maximum number of bytes to read from the reques
    read_length: 10_000_000, # amount of bytes to read at one time from the underlying socket to fill the chunk
    read_timeout: 120_000    # timeout for each socket read 
  plug Plug.MethodOverride
  plug Plug.Head
  plug Tui.API.Router

  def init(_key, config) do
    if config[:load_from_system_env] do
      port = System.get_env("PORT") || raise "expected the PORT environment variable to be set"
      {:ok, Keyword.put(config, :http, [:inet6, port: port])}
    else
      {:ok, config}
    end
  end
end
