defmodule ChatouriusWeb.RoomChannel do
  use Phoenix.Channel
  alias Chatourius.Repo
  alias Chatourius.Accounts.User

  def join("room", _payload, socket) do
    {:ok, socket}
  end

  def handle_in("message:new", payload, %{assigns: %{user_id: user_id}} = socket) do
    user = Repo.get(User, user_id)
    broadcast! socket, "message:new", %{user: user.email, message: payload["message"]}
    {:noreply, socket}
  end
end
