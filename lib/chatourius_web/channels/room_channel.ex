defmodule ChatouriusWeb.RoomChannel do
  use Phoenix.Channel
  alias Chatourius.Repo
  alias Chatourius.Accounts.User
  alias ChatouriusWeb.Presence

  def join("room", _payload, socket) do
    send(self(), :after_join)
    {:ok, socket}
  end

  def handle_info(:after_join, %{assigns: %{user_id: user_id}} = socket) do
    user = Repo.get(User, user_id)
    {:ok, _} = Presence.track(socket, user.email, %{online_at: inspect(System.system_time(:second))})
    push(socket, "presence_state", Presence.list(socket))
    {:noreply, socket}
  end
  def handle_in("message:new", payload, %{assigns: %{user_id: user_id}} = socket) do
    user = Repo.get(User, user_id)

    broadcast! socket, "message:new", %{user: user.email, message: payload["message"]}

    {:noreply, socket}
  end
end
