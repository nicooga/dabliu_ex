defmodule DabliuEx.CatalogController do
  use DabliuEx.Web, :jsonapi_controller
  use JaResource
  plug JaResource, except: [:delete]
end
