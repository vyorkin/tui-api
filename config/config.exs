# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tui,
  ecto_repos: [Tui.Repo]

# Configures the endpoint
config :tui, Tui.API.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r8/x1Xe8S5IV7G06yRunv9qfJarrUORLg3f7+Q6y7Ja07ngs6SVPfk4YNzb5p7iZ",
  render_errors: [view: Tui.API.Error, accepts: ~w(json)],
  pubsub: [name: Tui.PubSub, adapter: Phoenix.PubSub.PG2]

config :tui, Tui.API.Guardian,
  allowed_algos: ~w(HS512),
  token_verify_module: Guardian.Token.Jwt.Verify,
  issuer: "TUI",
  ttl: {30, :days},
  allowed_drift: 2000,
  verify_issuer: true,
  secret_key: "31ecw3Z4KOKgiLKdAYRv3smF4iIz1ADeRaxfAqsiycDkW7slwyXEsBML1ScNV2l2",
  secret_fetcher: Guardian.Token.Jwt.SecretFetcher

config :google_maps,
  api_key: "AIzaSyBzMs9bWagEr94ZRAaVPS8dAupJc2_rIBg"

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
