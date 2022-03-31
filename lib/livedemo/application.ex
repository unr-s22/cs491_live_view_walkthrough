defmodule Livedemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Livedemo.Repo,
      # Start the Telemetry supervisor
      LivedemoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Livedemo.PubSub},
      # Start the Endpoint (http/https)
      LivedemoWeb.Endpoint
      # Start a worker by calling: Livedemo.Worker.start_link(arg)
      # {Livedemo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Livedemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LivedemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
