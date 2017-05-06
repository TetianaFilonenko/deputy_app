defmodule DeputyApp.DeputyTest do
  use DeputyApp.ModelCase

  alias DeputyApp.Deputy

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Deputy.changeset(%Deputy{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Deputy.changeset(%Deputy{}, @invalid_attrs)
    refute changeset.valid?
  end
end
