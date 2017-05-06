defmodule DeputyApp.VotingFileTest do
  use DeputyApp.ModelCase

  alias DeputyApp.VotingFile

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = VotingFile.changeset(%VotingFile{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = VotingFile.changeset(%VotingFile{}, @invalid_attrs)
    refute changeset.valid?
  end
end
