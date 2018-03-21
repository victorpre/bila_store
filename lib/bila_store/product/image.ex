defmodule BilaStore.Product.Image do
  use Ecto.Schema
  import Ecto.Changeset


  schema "images" do
    field :url, :string
    field :item_id, :id

    timestamps()
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:url,:item_id])
    |> validate_required([:url, :item_id])
  end
end
