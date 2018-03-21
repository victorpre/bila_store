defmodule BilaStoreWeb.ImageController do
  use BilaStoreWeb, :controller

  alias BilaStore.Product
  alias BilaStore.Product.Image
  alias BilaStore.Product.Item
  alias BilaStore.Repo

  def index(conn, _params) do
    images = Product.list_images()
    render(conn, "index.html", images: images)
  end

  def new(conn, _params) do
    changeset = Product.change_image(%Image{})
    conn
    |> assign(:items, Repo.all(Item))
    |> render("new.html", changeset: changeset)
  end

  def create(conn, %{"image" => image_params}) do
    case Product.create_image(image_params) do
      {:ok, image} ->
        conn
        |> put_flash(:info, "Image created successfully.")
        |> redirect(to: image_path(conn, :show, image))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    image = Product.get_image!(id)
    render(conn, "show.html", image: image)
  end

  def edit(conn, %{"id" => id}) do
    image = Product.get_image!(id)
    changeset = Product.change_image(image)
    render(conn, "edit.html", image: image, changeset: changeset)
  end

  def update(conn, %{"id" => id, "image" => image_params}) do
    image = Product.get_image!(id)

    case Product.update_image(image, image_params) do
      {:ok, image} ->
        conn
        |> put_flash(:info, "Image updated successfully.")
        |> redirect(to: image_path(conn, :show, image))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", image: image, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    image = Product.get_image!(id)
    {:ok, _image} = Product.delete_image(image)

    conn
    |> put_flash(:info, "Image deleted successfully.")
    |> redirect(to: image_path(conn, :index))
  end
end
