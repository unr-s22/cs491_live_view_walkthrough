defmodule Livedemo.Repo do
  use Ecto.Repo,
    otp_app: :livedemo,
    adapter: Ecto.Adapters.Postgres
end
