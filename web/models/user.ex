defmodule DabliuEx.User do
  use DabliuEx.Web, :model
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  @allowed_attrs [:email, :encrypted_password]
  @required_attrs [:email, :encrypted_password]

  schema "users" do
    field :email, :string
    field :encrypted_password, :string

    timestamps()
  end

  def_custom_setter password(val),
    do: {"encrypted_password", hashpwsalt(val)}

  def changeset(struct, params \\ %{}) do
    custom_params = apply_custom_setters(params)
    IO.inspect(custom_params)

    #struct
    #|> cast(custom_params, @allowed_attrs)
    #|> validate_required(@required_attrs)
    #|> unique_constraint(:email)
  end

  def test do
    %{"email" => "2112.oga@gmail.com", "password": "password"}
    |> apply_custom_setters
  end
end
