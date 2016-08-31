defmodule DabliuEx.PageController do
  use DabliuEx.Web, :controller

  def index(conn, _params),
    do: render conn, :index

  def show_catalog(conn, %{"name" => name}) do
    conn |> render(:show_catalog)
  end
end
