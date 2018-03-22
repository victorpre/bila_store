defmodule BilaStoreWeb.ImageHelpers do
  def card_thumbnail(resource) do
    images =  resource.images
    case Enum.any?(images) do
      true -> Phoenix.HTML.Tag.img_tag(List.last(images) |> (fn(x)-> x.url end).())
      _ -> nil
    end
  end
end
