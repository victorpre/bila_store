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
    |> cast(attrs, [:url])
    |> validate_required([:url])
  end
end
