defmodule DeputyApp.Repo.Migrations.CreateVotingFile do
  use Ecto.Migration

  def change do
    create table(:voting_files) do
      add :name, :string

      timestamps()
    end

  end
end
