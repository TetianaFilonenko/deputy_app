defmodule DeputyApp.PageController do
  use DeputyApp.Web, :controller
  alias Ecto.Adapters.SQL
  alias DeputyApp.Deputy
  require Logger

  def index(conn, _params) do
    render conn, "index.html"
  end

  def likeliness(conn, %{"deputy_id" => deputy_id}) do
    #VERY UGLY, change in future
    querystring = "select other_deputies_votes.deputy_id, deputies.name, count(votes.vote_session_id) From votes join votes AS other_deputies_votes ON votes.result=other_deputies_votes.result AND other_deputies_votes.deputy_id <> votes.deputy_id AND votes.vote_session_id = other_deputies_votes.vote_session_id join deputies ON other_deputies_votes.deputy_id = deputies.id where votes.deputy_id=#{deputy_id} group by other_deputies_votes.deputy_id, deputies.name order by count DESC;"
    list = []
    result = SQL.query(Repo, querystring, [])
  	case result do
  	  {:ok, columns} ->
  	            list = for item <- columns.rows do
  	                %{
                       id: List.first(item),
                       name: Enum.at(item,1),
                       ration: Enum.at(item,2)
                      }
  	            end
  	  _ -> IO.puts("error")
  	end

    render(conn, "likeliness.json", deputies: list)
  end
end
