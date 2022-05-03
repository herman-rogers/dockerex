defmodule Dockex.Cluster do
  def start_link(_args) do
    children = [
      {Horde.Registry, [name: Dockex.Registry, keys: :unique]},
      {Horde.DynamicSupervisor, [name: Dockex.HordeSupervisor, strategy: :one_for_one]}
    ]

    opts = [strategy: :one_for_one, name: Dockex.Cluster.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
