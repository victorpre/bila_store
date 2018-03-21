defmodule BilaStore.Repo.Migrations.AddPriceToItems do
  use Ecto.Migration

  def change do
    alter table("items") do
      add :price, :integer
    end
  end
end
