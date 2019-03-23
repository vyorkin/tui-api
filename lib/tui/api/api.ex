defmodule Tui.API do
  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import Tui.Pagination
    end
  end

  def context do
    quote do
      import Ecto.Query, warn: false
    end
  end

  def controller do
    quote do
      use Phoenix.Controller, namespace: Tui.API

      import Ecto.Changeset
      import Plug.Conn

      import Tui.API.Router.Helpers
      import Tui.API.Plug.ValidateParams
      import Tui.API.Plug.Errors
      import Tui.Validation
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/tui/api/templates", namespace: Tui.API
      import Tui.API.Router.Helpers
    end
  end

  def router do
    quote do
      use Phoenix.Router

      import Plug.Conn
      import Phoenix.Controller
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
