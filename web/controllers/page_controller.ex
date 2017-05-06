defmodule DeputyApp.PageController do
  use DeputyApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
