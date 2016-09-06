defmodule DabliuEx.CatalogView do
  use DabliuEx.Web, :jsonapi_view

  attributes ~w(name)a
  has_many :items, serializer: DabliuEx.Catalog.ItemView
end
