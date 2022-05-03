defmodule Dockex.Repo do
  use Ecto.Repo,
    otp_app: :dockex,
    adapter: Ecto.Adapters.Postgres
end
