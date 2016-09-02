defmodule DabliuEx.User do
  use DabliuEx.Web, :model

  @allowed_attrs [:email, :encrypted_password]
  @required_attrs [:email, :encrypted_password]

  schema "users" do
    field :email, :string
    field :encrypted_password, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @allowed_attrs)
    |> validate_required(@required_attrs)
    |> unique_constraint(:email)
  end
end
