defmodule DabliuEx.Catalog.Item do
  use DabliuEx.Web, :model
  use DabliuEx.ArcModel, fields: [:image]

  @allowed_attrs ~w(position image catalog_id)a
  @required_attrs ~w(position image catalog_id)a

  schema "catalog_items" do
    field :position, :integer
    field :image, :string
    belongs_to :catalog, DabliuEx.Catalog
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @allowed_attrs)
    |> validate_required(@required_attrs)
  end
end
