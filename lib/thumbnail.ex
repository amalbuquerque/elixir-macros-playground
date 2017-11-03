defmodule MacrosPlayground.Thumbnail do
  @moduledoc """
  Documentation for MacrosPlayground.Thumbnail
  """

  def process(%{result: result} = event) do
    %{ event | result: result <> ".Thumbnail" }
  end
end
