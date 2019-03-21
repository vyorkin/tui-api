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
config :tui, TuiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r8/x1Xe8S5IV7G06yRunv9qfJarrUORLg3f7+Q6y7Ja07ngs6SVPfk4YNzb5p7iZ",
  render_errors: [view: TuiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Tui.PubSub, adapter: Phoenix.PubSub.PG2]

config :blue_bird,
  docs_path: "priv/static/docs",
  theme: "triple",
  router: TuiWeb.Router

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
