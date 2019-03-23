defmodule Tui.TestFactory do
  alias Tui.Repo

  def sequence(), do: System.unique_integer([:positive, :monotonic])
  def version(), do: Faker.App.semver(allow_pre: true, allow_build: true)

  def build(factory_name, attributes) do
    factory_name
    |> build()
    |> struct(attributes)
  end
end
