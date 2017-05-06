defmodule DeputyApp.VoteSessionController do
  use DeputyApp.Web, :controller

  alias DeputyApp.VoteSession

  def index(conn, _params) do
    vote_sessions = Repo.all(VoteSession)
    render(conn, "index.html", vote_sessions: vote_sessions)
  end

  def new(conn, _params) do
    changeset = VoteSession.changeset(%VoteSession{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"vote_session" => vote_session_params}) do
    changeset = VoteSession.changeset(%VoteSession{}, vote_session_params)

    case Repo.insert(changeset) do
      {:ok, _vote_session} ->
        conn
        |> put_flash(:info, "Vote session created successfully.")
        |> redirect(to: vote_session_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    vote_session = Repo.get!(VoteSession, id)
    render(conn, "show.html", vote_session: vote_session)
  end

  def edit(conn, %{"id" => id}) do
    vote_session = Repo.get!(VoteSession, id)
    changeset = VoteSession.changeset(vote_session)
    render(conn, "edit.html", vote_session: vote_session, changeset: changeset)
  end

  def update(conn, %{"id" => id, "vote_session" => vote_session_params}) do
    vote_session = Repo.get!(VoteSession, id)
    changeset = VoteSession.changeset(vote_session, vote_session_params)

    case Repo.update(changeset) do
      {:ok, vote_session} ->
        conn
        |> put_flash(:info, "Vote session updated successfully.")
        |> redirect(to: vote_session_path(conn, :show, vote_session))
      {:error, changeset} ->
        render(conn, "edit.html", vote_session: vote_session, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vote_session = Repo.get!(VoteSession, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(vote_session)

    conn
    |> put_flash(:info, "Vote session deleted successfully.")
    |> redirect(to: vote_session_path(conn, :index))
  end
end
