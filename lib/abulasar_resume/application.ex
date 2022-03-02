defmodule AbulasarResume.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AbulasarResume.Repo,
      # Start the Telemetry supervisor
      AbulasarResumeWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AbulasarResume.PubSub},
      # Start the Endpoint (http/https)
      AbulasarResumeWeb.Endpoint
      # Start a worker by calling: AbulasarResume.Worker.start_link(arg)
      # {AbulasarResume.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AbulasarResume.Supervisor]
    Neuron.Config.set(url: "https://api.hashnode.com/")
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AbulasarResumeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
