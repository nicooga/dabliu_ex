defmodule DabliuEx.Catalog.ItemView do
  use DabliuEx.Web, :jsonapi_view

  attributes ~w(position image)a
  preload :catalog
  has_one :catalog, serializer: DabliuEx.CatalogView
end
