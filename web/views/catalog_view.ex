defmodule DabliuEx.CatalogView do
  use DabliuEx.Web, :jsonapi_view

  attributes ~w(name)a
  preload :items
  has_many :items, serializer: DabliuEx.Catalog.ItemView
end
