# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, DiscussWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DwnwKPz+716Czkw+CKTRxzKhRktD5Sd568XJtEMpRXJ6sQGROZIPFkF6uDQxhoJY",
  render_errors: [view: DiscussWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :oauth2,
  serializers: %{
      "application/vnd.api+json" => Jason,
      "application/json" => Jason,
    }

#use ueberauth
config :ueberauth, Ueberauth,
  providers: [
      github: { Ueberauth.Strategy.Github, [] }
  ],
  json_library: Jason

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: "eca1f01076539cb11b6c",

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
