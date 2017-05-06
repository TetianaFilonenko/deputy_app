defmodule DeputyApp.VotingFileControllerTest do
  use DeputyApp.ConnCase

  alias DeputyApp.VotingFile
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, voting_file_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing voting files"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, voting_file_path(conn, :new)
    assert html_response(conn, 200) =~ "New voting file"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, voting_file_path(conn, :create), voting_file: @valid_attrs
    assert redirected_to(conn) == voting_file_path(conn, :index)
    assert Repo.get_by(VotingFile, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, voting_file_path(conn, :create), voting_file: @invalid_attrs
    assert html_response(conn, 200) =~ "New voting file"
  end

  test "shows chosen resource", %{conn: conn} do
    voting_file = Repo.insert! %VotingFile{}
    conn = get conn, voting_file_path(conn, :show, voting_file)
    assert html_response(conn, 200) =~ "Show voting file"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, voting_file_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    voting_file = Repo.insert! %VotingFile{}
    conn = get conn, voting_file_path(conn, :edit, voting_file)
    assert html_response(conn, 200) =~ "Edit voting file"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    voting_file = Repo.insert! %VotingFile{}
    conn = put conn, voting_file_path(conn, :update, voting_file), voting_file: @valid_attrs
    assert redirected_to(conn) == voting_file_path(conn, :show, voting_file)
    assert Repo.get_by(VotingFile, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    voting_file = Repo.insert! %VotingFile{}
    conn = put conn, voting_file_path(conn, :update, voting_file), voting_file: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit voting file"
  end

  test "deletes chosen resource", %{conn: conn} do
    voting_file = Repo.insert! %VotingFile{}
    conn = delete conn, voting_file_path(conn, :delete, voting_file)
    assert redirected_to(conn) == voting_file_path(conn, :index)
    refute Repo.get(VotingFile, voting_file.id)
  end
end
