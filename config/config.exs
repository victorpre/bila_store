# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bila_store,
  ecto_repos: [BilaStore.Repo]

# Configures the endpoint
config :bila_store, BilaStoreWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gQRtbMFCgXzSWxxfjbzF6WJGoHsboBMKdDCk6Yo79k9XvvvYAwEktlqjWmtzpH2T",
  render_errors: [view: BilaStoreWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BilaStore.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :bila_store, BilaStore.Auth.Guardian,
  issuer: "bila_store",
  secret_key: "EpHFEbnPhJusr+dl4NgdlyRrNun4xgQ22T6eMrVxTEZDZNGrIng0PinAPX1LziCQ"

  # Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
