defmodule DeputyApp.VotingFile do
  use DeputyApp.Web, :model

  schema "voting_files" do
    field :name, :string
    has_many :votes, HelloPhoenix.Vote
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
