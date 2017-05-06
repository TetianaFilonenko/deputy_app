defmodule DeputyApp.VoteSessionTest do
  use DeputyApp.ModelCase

  alias DeputyApp.VoteSession

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = VoteSession.changeset(%VoteSession{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = VoteSession.changeset(%VoteSession{}, @invalid_attrs)
    refute changeset.valid?
  end
end
