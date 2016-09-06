defmodule DabliuEx.AdminController do
  use DabliuEx.Web, :controller

  plug :put_layout, :admin

  def index(conn, _params), do: render conn, :index
end
