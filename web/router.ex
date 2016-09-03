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
    plug :accepts, ["json-api"]
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
  end

  scope "/admin" do
    pipe_through :browser

    addict :routes
    get "/", DabliuEx.AdminController, :index
  end

  scope "/api", DabliuEx do
    pipe_through :api

    resources "/catalogs", CatalogController
  end

  scope "/", DabliuEx do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/catálogos/:name", PageController, :show_catalog
  end
end
