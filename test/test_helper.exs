{:ok, _} = Application.ensure_all_started(:ex_machina)

BlueBird.start()
ExUnit.start(formatters: [ExUnit.CLIFormatter, BlueBird.Formatter])

Ecto.Adapters.SQL.Sandbox.mode(Tui.Repo, :manual)
