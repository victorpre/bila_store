defmodule BilaStoreWeb.Router do
  use BilaStoreWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug BilaStore.Auth.Pipeline
    plug BilaStore.Auth.CurrentUser
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", BilaStoreWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index
    get "/login", SessionController, :create
    post "/login", SessionController, :login
    get "/products", ProductController, :index
    get "/products/:id", ProductController, :show
  end

  scope "/", BilaStoreWeb do
    pipe_through [:browser, :auth, :ensure_auth]
    post "/logout", SessionController, :logout
    resources "/items", ItemController
    resources "/images", ImageController
  end
end
