defmodule MacrosPlayground.UploadRequester do
  @moduledoc false

  def process(to_process) when is_binary(to_process) do
    %{ result: to_process }
  end
end
