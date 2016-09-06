defmodule DabliuEx.Catalog.ItemView do
  use DabliuEx.Web, :jsonapi_view

  def type, do: "catalog_items"
  attributes ~w(position image)a
  has_one :catalog, serializer: DabliuEx.CatalogView, field: :catalog_id
end
