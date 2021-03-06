defmodule DabliuEx.UserTest do
  use DabliuEx.ModelCase

  alias DabliuEx.User

  @valid_attrs %{
    email: "2112.oga@gmail.com",
    encrypted_password: "some content"
  }

  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
