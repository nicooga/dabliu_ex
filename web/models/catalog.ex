defmodule DabliuEx.Catalog do
  use DabliuEx.Web, :model

  @allowed_attrs ~w(name)a
  @required_attrs ~w(name)a

  schema "catalogs" do
    field :name, :string
    has_many :items, __MODULE__.Item
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @allowed_attrs)
    |> validate_required(@required_attrs)
    |> unique_constraint(:name)
    |> cast_assoc(:items)
  end
end
