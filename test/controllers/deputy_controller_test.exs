defmodule DeputyApp.DeputyControllerTest do
  use DeputyApp.ConnCase

  alias DeputyApp.Deputy
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, deputy_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing deputies"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, deputy_path(conn, :new)
    assert html_response(conn, 200) =~ "New deputy"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, deputy_path(conn, :create), deputy: @valid_attrs
    assert redirected_to(conn) == deputy_path(conn, :index)
    assert Repo.get_by(Deputy, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, deputy_path(conn, :create), deputy: @invalid_attrs
    assert html_response(conn, 200) =~ "New deputy"
  end

  test "shows chosen resource", %{conn: conn} do
    deputy = Repo.insert! %Deputy{}
    conn = get conn, deputy_path(conn, :show, deputy)
    assert html_response(conn, 200) =~ "Show deputy"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, deputy_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    deputy = Repo.insert! %Deputy{}
    conn = get conn, deputy_path(conn, :edit, deputy)
    assert html_response(conn, 200) =~ "Edit deputy"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    deputy = Repo.insert! %Deputy{}
    conn = put conn, deputy_path(conn, :update, deputy), deputy: @valid_attrs
    assert redirected_to(conn) == deputy_path(conn, :show, deputy)
    assert Repo.get_by(Deputy, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    deputy = Repo.insert! %Deputy{}
    conn = put conn, deputy_path(conn, :update, deputy), deputy: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit deputy"
  end

  test "deletes chosen resource", %{conn: conn} do
    deputy = Repo.insert! %Deputy{}
    conn = delete conn, deputy_path(conn, :delete, deputy)
    assert redirected_to(conn) == deputy_path(conn, :index)
    refute Repo.get(Deputy, deputy.id)
  end
end
