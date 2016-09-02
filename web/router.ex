defmodule DabliuEx.Router do
  use DabliuEx.Web, :router
  use Addict.RoutesHelper

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/admin" do
    addict :routes
  end

  scope "/", DabliuEx do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/catálogos/:name", PageController, :show_catalog
  end
end
