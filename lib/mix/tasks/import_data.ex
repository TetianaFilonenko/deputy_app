defmodule Mix.Tasks.CustomPhoenix.ImportData do
  use Mix.Task
  require Logger
  import Mix.Ecto
  import Ecto.Query
  alias DeputyApp.Repo
  alias DeputyApp.VotingFile
  alias DeputyApp.VoteSession
  alias DeputyApp.Deputy
  alias DeputyApp.Vote
  @shortdoc "Save data from csv-s files to database"

  @moduledoc """
    This is where we would put any long form documentation or doctests.
  """

  def run(_args) do
    ensure_started(Repo, [])
    Repo.delete_all(Vote)
    Repo.delete_all(VoteSession)
    Repo.delete_all(Deputy)
    Repo.delete_all(VotingFile)
    Path.expand('output_files') |>  
    File.ls! |> 
    Enum.map(&Path.join(Path.expand('output_files'), &1)) |>
    Enum.map(&save_voting_file(&1))
  end

  def save_voting_file(name) do
    Repo.insert!(%VotingFile{name: name}) |> 
    save_sessions
  end

  def save_sessions(obj) do
    obj.name |> 
    File.ls! |>
    Enum.map(&Path.join(obj.name, &1)) |>
    Enum.map(&save_session(&1, obj.id))
  end

  def save_session(name, file_id) do
    Repo.insert!(%VoteSession{name: name, file_id: file_id}) |>
    parse_session_file
  end

  def parse_session_file(session_obj) do
    File.stream!(session_obj.name) |>
    CSV.decode(separator: ?\t) |>
    Enum.map(fn row ->
      Enum.map(row, &String.upcase/1)
    end) |>
    Enum.reject(fn row ->
      row |>
      List.first |>
      String.split(",") |>
      List.first |>
      Integer.parse |>
      case do
        {_num, ""} -> false
        _ -> true
      end
    end) |>
    Enum.map(&save_deputy_and_votes(&1, session_obj.id))
  end

  def save_deputy_and_votes(row, session_id) do
    name = row |> List.first |> String.split(",") |> Enum.at 1
    result = row |> List.first |> String.split(",") |> Enum.at 2
    cond do
      String.length(name) > 0 ->
        query = from deputy in Deputy,
              where: deputy.name == ^name
        (Repo.one(query) || Repo.insert!(%Deputy{name: name})) |>
        save_vote(session_id, result)
      true -> "This is always true"
    end
  end

  def save_vote(deputy, session_id, result) do
    Repo.insert!(%Vote{result: result, 
                       deputy_id: deputy.id,
                       vote_session_id: session_id})
  end
end