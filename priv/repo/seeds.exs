# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
 #
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Tui.Travel
alias Tui.Travel.{TravelCategory, TravelCountry}

[
  %{id: 1, name: "пляж"},
  %{id: 2, name: "горные лыжи"},
  %{id: 3, name: "экскурсии"},
  %{id: 4, name: "шопинг"}
] |> Enum.map(&Travel.create_travel_category/1)
