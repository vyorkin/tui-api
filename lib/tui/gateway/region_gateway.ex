defmodule Tui.Gateway.RegionGateway do
  import SweetXml
  use HTTPoison.Base

  alias Tui.Gateway.Url

  def fetch do
    get!("").body
    |> Enum.filter(&valid_item?/1)
  end

  def process_request_options(_) do
   [recv_timeout: 1000000]
  end

  def process_request_url(_),
    do: Url.build("region")

  def process_response_body(body) do
    xpath(body, ~x"//region"l,
      id: ~x"./@inc"I,
      country_id: ~x"./@state"I,
      name: ~x"./@name"s,
      name_lat: ~x"./@lname"s
    )
  end

  defp valid_item?(item) do
    item.id > 0 &&
    item.country_id > 0 &&
    item.name != ""
  end
end
