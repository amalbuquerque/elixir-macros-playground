defmodule MacrosPlayground.Encryption do
  @moduledoc """
  Documentation for MacrosPlayground.Encryption
  """

  def process(%{result: result} = event) do
    %{ event | result: result <> ".Encryption" }
  end
end
