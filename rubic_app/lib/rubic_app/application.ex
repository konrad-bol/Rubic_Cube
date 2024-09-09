defmodule RubicApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RubicAppWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:rubic_app, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RubicApp.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: RubicApp.Finch},
      # Start a worker by calling: RubicApp.Worker.start_link(arg)
      # {RubicApp.Worker, arg},
      # Start to serve requests, typically the last entry
      RubicAppWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RubicApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RubicAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
