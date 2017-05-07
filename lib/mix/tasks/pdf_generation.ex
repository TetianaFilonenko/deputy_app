defmodule Mix.Tasks.CustomPhoenix.PdfGeneration do
  use Mix.Task

  @shortdoc "Load jruby rake task"

  @moduledoc """
    This is where we would put any long form documentation or doctests.
  """

  def run(_args) do
    System.cmd("rake", ['pdf_to_file'], into: IO.stream(:stdio, :line))
  end

  # We can define other functions as needed here.
end