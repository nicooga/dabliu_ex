defmodule DabliuEx.Repo.Migrations.CreateCatalog.Item do
  use Ecto.Migration

  def change do
    create table(:catalog_items) do
      add :position, :integer
      add :image, :string
      add :catalog, references(:catalogs, on_delete: :nothing)

      timestamps()
    end

    create index(:catalog_items, [:catalog])
  end
end
