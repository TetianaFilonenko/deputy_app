defmodule DeputyApp.Repo.Migrations.CreateVote do
  use Ecto.Migration

  def change do
    create table(:votes) do
      add :result, :string
      add :deputy_id, references(:deputies, on_delete: :nothing)
      add :vote_session_id, references(:vote_sessions, on_delete: :nothing)

      timestamps()
    end
    create index(:votes, [:deputy_id])
    create index(:votes, [:vote_session_id])

  end
end
