defmodule DeputyApp.DeputyController do
  use DeputyApp.Web, :controller

  alias DeputyApp.Deputy

  def index(conn, _params) do
    deputies = Repo.all(Deputy)
    render(conn, "index.html", deputies: deputies)
  end

  def new(conn, _params) do
    changeset = Deputy.changeset(%Deputy{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"deputy" => deputy_params}) do
    changeset = Deputy.changeset(%Deputy{}, deputy_params)

    case Repo.insert(changeset) do
      {:ok, _deputy} ->
        conn
        |> put_flash(:info, "Deputy created successfully.")
        |> redirect(to: deputy_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    deputy = Repo.get!(Deputy, id)
    render(conn, "show.html", deputy: deputy)
  end

  def edit(conn, %{"id" => id}) do
    deputy = Repo.get!(Deputy, id)
    changeset = Deputy.changeset(deputy)
    render(conn, "edit.html", deputy: deputy, changeset: changeset)
  end

  def update(conn, %{"id" => id, "deputy" => deputy_params}) do
    deputy = Repo.get!(Deputy, id)
    changeset = Deputy.changeset(deputy, deputy_params)

    case Repo.update(changeset) do
      {:ok, deputy} ->
        conn
        |> put_flash(:info, "Deputy updated successfully.")
        |> redirect(to: deputy_path(conn, :show, deputy))
      {:error, changeset} ->
        render(conn, "edit.html", deputy: deputy, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    deputy = Repo.get!(Deputy, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(deputy)

    conn
    |> put_flash(:info, "Deputy deleted successfully.")
    |> redirect(to: deputy_path(conn, :index))
  end
end
