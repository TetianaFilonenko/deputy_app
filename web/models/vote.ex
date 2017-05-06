defmodule DeputyApp.Vote do
  use DeputyApp.Web, :model

  schema "votes" do
    field :result, :string
    belongs_to :deputy, DeputyApp.Deputy
    belongs_to :vote_session, DeputyApp.VoteSession

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:result])
    |> validate_required([:result])
  end
end
