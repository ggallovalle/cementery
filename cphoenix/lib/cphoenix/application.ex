defmodule Cphoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Cphoenix.Repo,
      # Start the Telemetry supervisor
      CphoenixWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Cphoenix.PubSub},
      # Start the Endpoint (http/https)
      CphoenixWeb.Endpoint
      # Start a worker by calling: Cphoenix.Worker.start_link(arg)
      # {Cphoenix.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Cphoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CphoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
