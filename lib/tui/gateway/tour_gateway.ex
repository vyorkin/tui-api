defmodule Tui.Gateway.TourGateway do
  use HTTPoison.Base

  alias Tui.Gateway.Url

  def fetch do
    get!("").body
  end

  def process_request_options(_) do
   [recv_timeout: 10000000]
  end

  # samo_action=api&oauth_token=1ca29a397ca949438e9ba93287e9fa06&action=SearchTour_ALL&STATEINC=210357

  def process_request_url(_) do
    Url.build(%{
      samo_action: "api",
      action: "SearchTour_ALL",
      type: "json"
    })
  end

  def process_response_body(body) do
    body
    |> Jason.decode!()
    |> Map.fetch!("SearchTour_ALL")
  end
end
