defmodule Dockex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Dockex.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Dockex.PubSub}
      # Start a worker by calling: Dockex.Worker.start_link(arg)
      # {Dockex.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Dockex.Supervisor)
    Dockex.Cluster.start_link([])
  end
end
