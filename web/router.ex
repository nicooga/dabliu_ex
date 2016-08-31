defmodule DabliuEx.Router do
  use DabliuEx.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DabliuEx do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/catálogos/:name", PageController, :show_catalog

    resources "/session", SessionController,
      singleton: true,
      only: ~w(new create destroy)
  end
end
