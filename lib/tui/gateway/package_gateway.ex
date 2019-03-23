defmodule Tui.Gateway.PackageGateway do
  use HTTPoison.Base

  alias Tui.Gateway.Url

  def fetch(country_id) do
    get!(country_id).body
  end

  def process_request_options(_) do
   [recv_timeout: 10000000]
  end

  # samo_action=reference
  # &oauth_token=1234567890
  # &type=price
  # &townfrom=2
  # &state=3
  # &catalog=82619
  # &data=1
  # &checkin=2016-08-12
  # &nights=10

  def process_request_url(country_id) do
    url = Url.build(%{
      token: :oauth_token_ref,
      samo_action: "api",
      type: "price",
      STATEINC: country_id,
      TOWNFROMINC: 274286,
      catalog: 82619
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
