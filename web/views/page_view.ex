defmodule DeputyApp.PageView do
  require Logger
  use DeputyApp.Web, :view
  def render("likeliness.json", %{deputies: deputies}) do
    deputies
  end
end
