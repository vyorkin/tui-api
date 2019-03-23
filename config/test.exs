use Mix.Config

config :tui, :environment, :test

config :tui, :oauth_token_ref, "43041fdef08948cab269de623fa58dfe"
config :tui, :oauth_token_api, "1ca29a397ca949438e9ba93287e9fa06"

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tui, Tui.API.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Be less secure (and faster) in the test env
config :argon2_elixir,
  t_cost: 2
  m_cost: 12

# Configure your database
config :tui, Tui.Repo,
  username: "postgres",
  database: "tui_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
