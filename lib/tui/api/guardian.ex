defmodule Tui.API.Guardian do
  use Guardian, otp_app: :tui

  alias Tui.Auth
  alias Tui.Auth.User

  def subject_for_token(user = %User{}, _), do: {:ok, "User:#{user.id}"}
  def subject_for_token(_, _), do: {:error, "Unknown resource type"}

  def resource_from_claims("User:" <> id), do: {:ok, Auth.get_user!(id)}
  def resource_from_claims(_), do: {:error, "Unknown resource type"}
end
