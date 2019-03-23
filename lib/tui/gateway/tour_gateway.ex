defmodule Tui.Gateway.TourGateway do
  use HTTPoison.Base

  alias Tui.Gateway.Url

  def fetch(country_id) do
    get!(country_id).body
  end

  def process_request_options(_) do
   [recv_timeout: 10000000]
  end

  def process_request_url(country_id) do
    url = Url.build(%{
      token: :oauth_token_api,
      samo_action: "api",
      action: "SearchTour_ALL",
      type: "json",
      STATEINC: country_id,
      TOWNFROMINC: 274286
    })
    IO.puts("GET: " <> url)
    url
  end

  def process_response_body(body) do
    IO.puts "BODY:"
    IO.puts body

    json = body |> Jason.decode!()
    json |> Map.fetch!("SearchTour_ALL")
  end
end
