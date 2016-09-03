defmodule DabliuEx.Catalog do
  use DabliuEx.Web, :model

  @allowed_attrs [:name]
  @required_attrs [:name]

  schema "catalogs" do
    field :name, :string
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @allowed_attrs)
    |> validate_required(@required_attrs)
    |> unique_constraint(:name)
  end
end
