defmodule DeputyApp.VotingFileController do
  use DeputyApp.Web, :controller

  alias DeputyApp.VotingFile

  def index(conn, _params) do
    voting_files = Repo.all(VotingFile)
    render(conn, "index.html", voting_files: voting_files)
  end

  def new(conn, _params) do
    changeset = VotingFile.changeset(%VotingFile{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"voting_file" => voting_file_params}) do
    changeset = VotingFile.changeset(%VotingFile{}, voting_file_params)

    case Repo.insert(changeset) do
      {:ok, _voting_file} ->
        conn
        |> put_flash(:info, "Voting file created successfully.")
        |> redirect(to: voting_file_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    voting_file = Repo.get!(VotingFile, id)
    render(conn, "show.html", voting_file: voting_file)
  end

  def edit(conn, %{"id" => id}) do
    voting_file = Repo.get!(VotingFile, id)
    changeset = VotingFile.changeset(voting_file)
    render(conn, "edit.html", voting_file: voting_file, changeset: changeset)
  end

  def update(conn, %{"id" => id, "voting_file" => voting_file_params}) do
    voting_file = Repo.get!(VotingFile, id)
    changeset = VotingFile.changeset(voting_file, voting_file_params)

    case Repo.update(changeset) do
      {:ok, voting_file} ->
        conn
        |> put_flash(:info, "Voting file updated successfully.")
        |> redirect(to: voting_file_path(conn, :show, voting_file))
      {:error, changeset} ->
        render(conn, "edit.html", voting_file: voting_file, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    voting_file = Repo.get!(VotingFile, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(voting_file)

    conn
    |> put_flash(:info, "Voting file deleted successfully.")
    |> redirect(to: voting_file_path(conn, :index))
  end
end
