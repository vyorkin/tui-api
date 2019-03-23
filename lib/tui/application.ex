defmodule Tui.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tui.Supervisor]

    env = Application.get_env(:tui, :environment)
    Supervisor.start_link(children(env), opts)
  end

  defp children(:test), do: children_default()
  defp children(_) do
    children_default() ++ [
      # custom workers, if any
    ]
  end

  defp children_default do
    # List all child processes to be supervised
    children = [
      # Start the Ecto repository
      Tui.Repo,
      # Start the endpoint when the application starts
      Tui.API.Endpoint
    ]
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Tui.API.Endpoint.config_change(changed, removed)
    :ok
  end
end
