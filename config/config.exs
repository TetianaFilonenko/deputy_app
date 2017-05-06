# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :deputy_app,
  ecto_repos: [DeputyApp.Repo]

# Configures the endpoint
config :deputy_app, DeputyApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tmhvo70D8qS8IBPo1+NcgeTfq/zBO2CH7nYIdybrxlwwni8+FTgXOe41t2DCQhIh",
  render_errors: [view: DeputyApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DeputyApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
