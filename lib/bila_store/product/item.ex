defmodule BilaStore.Product.Item do
  use Ecto.Schema
  import Ecto.Changeset

  alias BilaStore.Product.Image

  schema "items" do
    field :description, :string
    field :name, :string
    field :price, :integer
    has_many :images, Image

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :description, :price])
    |> validate_required([:name, :description, :price])
  end
end
