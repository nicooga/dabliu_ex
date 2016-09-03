defmodule DabliuEx.CatalogTest do
  use DabliuEx.ModelCase

  alias DabliuEx.Catalog

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Catalog.changeset(%Catalog{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Catalog.changeset(%Catalog{}, @invalid_attrs)
    refute changeset.valid?
  end
end
