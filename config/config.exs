# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# is restricted to this project.
# This configuration file is loaded before any dependency and
use Mix.Config

secret_key = case System.get_env("SECRET_KEY") do
  nil ->
    case Mix.env do
      :prod -> throw("I NEED A SECRET KEY PIBE")
      _ -> "asdfljjasdflkjahsdflkjahdsflkjasdhflkjfhasldkfjhasdflkjhqwerlkjhasdflkjhasdflkjhfads"
    end
  str -> str
end
config :phoenix, :format_encoders,
  "json-api": Poison

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

config :ja_resource,
  repo: DabliuEx.Repo

# General application configuration
config :dabliu_ex,
  ecto_repos: [DabliuEx.Repo]

# Configures the endpoint
config :dabliu_ex, DabliuEx.Endpoint,
  url: [host: "localhost"],
  secret_key_base: secret_key,
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
  secret_key: secret_key,
  serializer: DabliuEx.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :addict,
  secret_key: secret_key,
  user_schema: DabliuEx.User,
  repo: DabliuEx.Repo,
  from_email: "no-reply@dabliu.com",
mail_service: nil
