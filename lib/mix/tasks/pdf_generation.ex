defmodule Mix.Tasks.CustomPhoenix.PdfGeneration do
  use Mix.Task

  @shortdoc "Sends a greeting to us from Hello Phoenix"

  @moduledoc """
    This is where we would put any long form documentation or doctests.
  """

  def run(_args) do
  System.cmd("rake", ['hello'], into: IO.stream(:stdio, :line))
  end

  # We can define other functions as needed here.
end