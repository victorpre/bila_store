defmodule BilaStore.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :url, :string
      add :item_id, references(:items, on_delete: :nothing)

      timestamps()
    end

    create index(:images, [:item_id])
  end
end
