# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :dabliu_ex,
  ecto_repos: [DabliuEx.Repo]

# Configures the endpoint
config :dabliu_ex, DabliuEx.Endpoint,
  url: [host: "localhost"],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  render_errors: [
    view: DabliuEx.ErrorView,
    accepts: ~w(html json)
  ],
  pubsub: [
    name: DabliuEx.PubSub,
    adapter: Phoenix.PubSub.PG2
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "DabliuEx",
  ttl: { 30, :days },
  secret_key: System.get_env("SECRET_KEY_BASE"),
  serializer: DabliuEx.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
