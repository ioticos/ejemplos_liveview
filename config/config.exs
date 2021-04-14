# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :liveview_notion,
  ecto_repos: [LiveviewNotion.Repo]

# Configures the endpoint
config :liveview_notion, LiveviewNotionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gX6Jj8ERdM/8rNEzn94od+CzEIArKanEFatlgrpzcOnzkK4L84SooAlzFqmS86wh",
  render_errors: [view: LiveviewNotionWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveviewNotion.PubSub,
  live_view: [signing_salt: "FgBVoLzO"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
