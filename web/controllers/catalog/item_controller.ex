defmodule DabliuEx.Catalog.ItemController do
  use DabliuEx.Web, :jsonapi_controller

  def model, do: DabliuEx.Catalog.Item

  def records(%{params: %{"catalog_id" => id}}) do
    model
    |> join(:left, [i], c in assoc(i, :catalog))
    |> where([i, c], c.id == ^id)
  end

  def handle_create(%{params: %{"catalog_id" => id}}, attributes) do
    model.changeset(model, attributes |> Map.put("catalog_id", id))
  end
end
