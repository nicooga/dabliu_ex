defmodule DabliuEx.AdminController do
  use DabliuEx.Web, :controller

  plug :put_layout, false

  def index(conn, _params), do: render conn, "index.html"
end
