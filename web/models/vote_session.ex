defmodule DeputyApp.VoteSession do
  use DeputyApp.Web, :model

  schema "vote_sessions" do
    field :name, :string
    belongs_to :file, DeputyApp.File

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
