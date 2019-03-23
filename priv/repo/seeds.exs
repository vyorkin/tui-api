# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Tui.Travel
alias Tui.Travel.{TravelCategory}

[
  %{name: "пляж"},
  %{name: "горные лыжи"},
  %{name: "экскурсии"},
  %{name: "шопинг"}
] |> Enum.map(&Travel.create_travel_category/1)
