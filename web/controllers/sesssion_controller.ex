defmodule DabliuEx.SessionController do
  use DabliuEx.Web, :controller

  def new(conn, _params), do: render conn, :new

  def create(conn, %{email: email, password: password}) do
    case User.find_and_confirm_password(email, password) do
      {:ok, user} ->
         conn
         |> Guardian.Plug.sign_in(user)
         |> redirect(to: "/")
      {:error, changeset} ->
        render conn, "login.html", changeset: changeset
    end
  end
end
