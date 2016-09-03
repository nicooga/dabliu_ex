defmodule DabliuEx.Repo.Migrations.CreateCatalog do
  use Ecto.Migration

  def change do
    create table(:catalogs) do
      add :name, :string
      timestamps()
    end

    create unique_index(:catalogs, [:name])
  end
end
