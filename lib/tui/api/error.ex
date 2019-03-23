defmodule Tui.API.Error do
  def render("400.json", _), do: %{error: "Bad Request"}
  def render("401.json", _), do: %{error: "Unauthorized"}
  def render("403.json", _), do: %{error: "Forbidden"}
  def render("404.json", _), do: %{error: "Not Found"}
  def render("405.json", _), do: %{error: "Method Not Allowed"}
  def render("413.json", _), do: %{error: "Request entity to large"}
  def render("422.json", _), do: %{error: "Unprocessable Entity"}
  def render("500.json", _), do: %{error: "Internal Server Error"}

  # in case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render("500.json", assigns)
  end
end
