defmodule BilaStoreWeb.ProductController do
  use BilaStoreWeb, :controller

  alias BilaStore.Product
  def index(conn, _params) do
    products = Product.list_all_products()
    render(conn, "index.html", products: products)
  end

  def show(conn, %{"id" => id}) do
    product = Product.get_product_with_image(id)
    render(conn, "show.html", product: product)
  end
end
