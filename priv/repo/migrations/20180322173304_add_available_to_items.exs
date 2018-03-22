defmodule BilaStore.Repo.Migrations.AddAvailableToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :available, :boolean, default: true
    end
  end
end
