defmodule MacrosPlayground do
  @moduledoc false

  require Pipeliner

  alias MacrosPlayground.UploadRequester
  alias MacrosPlayground.Thumbnail
  alias MacrosPlayground.Encryption
  alias MacrosPlayground.UploadPerformer

  def hello do
    :world
  end

  def pipeline(content \\ "CONTENT") do
    content
    |> UploadRequester.process()
    |> Thumbnail.process()
    |> Encryption.process()
    |> UploadPerformer.process()
  end

  def steps(indx), do: Enum.at(all_steps(), indx)

  def all_steps, do: [
    &UploadRequester.process/1,
    &Thumbnail.process/1,
    &Encryption.process/1,
    &UploadPerformer.process/1
  ]

  def pipeline_2(content \\ "CONTENT") do
    content
    |> steps(0).()
    |> steps(1).()
    |> steps(2).()
    |> steps(3).()
  end

  def pipeline_3(content \\ "CONTENT") do
    all_steps()
    |> Enum.reduce(content, fn step, acc ->
      step.(acc)
    end)
  end

  def pipeline_4(content \\ "CONTENT") do
    content
    |> Pipeliner.dynamic_pipeline_steps(all_steps())
  end

  def all_modules, do: [
    UploadRequester,
    Thumbnail,
    Encryption,
    UploadPerformer
  ]

  def pipeline_5(content \\ "CONTENT") do
    content
    |> Pipeliner.dynamic_pipeline_modules(all_modules())
  end
end
