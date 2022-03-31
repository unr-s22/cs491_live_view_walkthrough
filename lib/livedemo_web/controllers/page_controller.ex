defmodule LivedemoWeb.PageController do
  use LivedemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
