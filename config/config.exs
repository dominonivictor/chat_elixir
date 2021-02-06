# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chatourius,
  ecto_repos: [Chatourius.Repo]

# Configures the endpoint
config :chatourius, ChatouriusWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FLvzvDR4dMXHLweJ9lsFpc0kz9MSqBKbhI+Bk0ctRGy+IkAPP7nXqqUsum5u2GPc",
  render_errors: [view: ChatouriusWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Chatourius.PubSub,
  live_view: [signing_salt: "V8g4z1vU"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
