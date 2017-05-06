defmodule DeputyApp.Repo.Migrations.CreateVoteSession do
  use Ecto.Migration

  def change do
    create table(:vote_sessions) do
      add :name, :string
      add :file_id, references(:voting_files, on_delete: :nothing)

      timestamps()
    end
    create index(:vote_sessions, [:file_id])

  end
end
