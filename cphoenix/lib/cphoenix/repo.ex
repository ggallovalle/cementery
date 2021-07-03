defmodule Cphoenix.Repo do
  use Ecto.Repo,
    otp_app: :cphoenix,
    adapter: Ecto.Adapters.Postgres
end
