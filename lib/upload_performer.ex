defmodule MacrosPlayground.UploadPerformer do
  @moduledoc false

  def process(%{ result: _result} = to_upload) do
    IO.puts "Let's perform the actual upload of #{inspect(to_upload)}!"
  end
end
