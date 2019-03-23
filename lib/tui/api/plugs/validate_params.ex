defmodule Tui.API.Plug.ValidateParams do
  defmodule ThePlug do
    import Plug.Conn
    import Phoenix.Controller

    alias Tui.ErrorFormatter

    def init(opts), do: opts

    def call(conn, opts) do
      if action_name(conn) == opts[:action] do
        conn |> validate(opts[:fun])
      else
        conn
      end
    end

    defp validate(conn, fun) do
      changeset = apply(fun, [conn.params])

      if changeset.valid? do
        %{conn | params: changeset.changes}
      else
        errors = ErrorFormatter.changeset_errors(changeset)
        conn
        |> put_status(422)
        |> json(%{errors: errors})
        |> halt
      end
    end
  end

  defmacro validate_params(action, spec, fun \\ &__MODULE__.noop/1) do
    function_name = String.to_atom("validate_params_for_#{action}")

    quote do
      def unquote(function_name)(params) do
        types = unquote(spec)
        keys = Map.keys(types)
        changeset = Ecto.Changeset.cast({%{}, types}, params, keys)
        apply(unquote(fun), [changeset])
      end

      plug Tui.API.Plug.ValidateParams.ThePlug,
        [fun: &unquote(__CALLER__.module).unquote(function_name)/1,
        action: unquote(action)]
    end
  end

  def noop(changeset), do: changeset
end
