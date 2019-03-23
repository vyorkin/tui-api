defmodule Tui.API.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Such tests rely on `Phoenix.ConnTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  it cannot be async. For this reason, every test runs
  inside a transaction which is reset at the beginning
  of the test unless the test case is marked as async.
  """

  use ExUnit.CaseTemplate

  defmodule Helpers do
    defmacro __using__(_) do
      quote do
        def sign_in(conn, user) do
          {:ok, jwt, _} = Tui.API.Guardian.encode_and_sign(user)
          conn |> Plug.Conn.put_req_header("authorization", "Bearer #{jwt}")
        end
      end
    end
  end

  using do
    quote do
      # Import conveniences for testing with connections
      use Phoenix.ConnTest

      import Tui.TestFactory

      alias Tui.API.Router.Helpers, as: Routes
      alias Tui.Repo

      # The default endpoint for testing
      @endpoint Tui.API.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Tui.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Tui.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
