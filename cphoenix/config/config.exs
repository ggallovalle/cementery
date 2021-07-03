# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cphoenix,
  ecto_repos: [Cphoenix.Repo]

# Configures the endpoint
config :cphoenix, CphoenixWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xmRSLpvfBGIWAOCSNLY/8v/oScoQymDGVFaBdukKeDpsLU78D9LXJ1tdGlLg5PIZ",
  render_errors: [view: CphoenixWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Cphoenix.PubSub,
  live_view: [signing_salt: "7T0hUVAD"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
