defmodule Tui.Repo do
  use Ecto.Repo,
    otp_app: :tui,
    adapter: Ecto.Adapters.Postgres
end
