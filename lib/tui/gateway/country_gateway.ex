defmodule Tui.Gateway.CountryGateway do
  import SweetXml
  use HTTPoison.Base

  alias Tui.Gateway.Url

  def fetch do
    get!("").body
    |> Enum.filter(&valid_item?/1)
  end

  def process_request_options(_) do
   [recv_timeout: 10000000]
  end

  def process_request_url(_) do
    Url.build(%{
      token: :oauth_token_ref,
      samo_action: "reference",
      type: "state"
    })
  end

  def process_response_body(body) do
    xpath(body, ~x"//state"l,
      id: ~x"./@inc"I,
      name: ~x"./@name"s,
      name_lat: ~x"./@lname"s
    )
  end

  defp valid_item?(item) do
    item.id > 1 &&
    item.name != ""
  end
end
