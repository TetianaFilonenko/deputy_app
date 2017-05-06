defmodule DeputyApp.Router do
  use DeputyApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DeputyApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/deputies", DeputyController
    resources "/voting_files", VotingFileController
    resources "/vote_sessions", VoteSessionController
    resources "/votes", VoteController
  end

  # Other scopes may use custom stacks.
  # scope "/api", DeputyApp do
  #   pipe_through :api
  # end
end
