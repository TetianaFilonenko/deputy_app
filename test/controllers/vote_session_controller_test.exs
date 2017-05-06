defmodule DeputyApp.VoteSessionControllerTest do
  use DeputyApp.ConnCase

  alias DeputyApp.VoteSession
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, vote_session_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing vote sessions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, vote_session_path(conn, :new)
    assert html_response(conn, 200) =~ "New vote session"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, vote_session_path(conn, :create), vote_session: @valid_attrs
    assert redirected_to(conn) == vote_session_path(conn, :index)
    assert Repo.get_by(VoteSession, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, vote_session_path(conn, :create), vote_session: @invalid_attrs
    assert html_response(conn, 200) =~ "New vote session"
  end

  test "shows chosen resource", %{conn: conn} do
    vote_session = Repo.insert! %VoteSession{}
    conn = get conn, vote_session_path(conn, :show, vote_session)
    assert html_response(conn, 200) =~ "Show vote session"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, vote_session_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    vote_session = Repo.insert! %VoteSession{}
    conn = get conn, vote_session_path(conn, :edit, vote_session)
    assert html_response(conn, 200) =~ "Edit vote session"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    vote_session = Repo.insert! %VoteSession{}
    conn = put conn, vote_session_path(conn, :update, vote_session), vote_session: @valid_attrs
    assert redirected_to(conn) == vote_session_path(conn, :show, vote_session)
    assert Repo.get_by(VoteSession, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    vote_session = Repo.insert! %VoteSession{}
    conn = put conn, vote_session_path(conn, :update, vote_session), vote_session: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit vote session"
  end

  test "deletes chosen resource", %{conn: conn} do
    vote_session = Repo.insert! %VoteSession{}
    conn = delete conn, vote_session_path(conn, :delete, vote_session)
    assert redirected_to(conn) == vote_session_path(conn, :index)
    refute Repo.get(VoteSession, vote_session.id)
  end
end
