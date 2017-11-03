defmodule Pipeliner do
  defmacro dynamic_pipeline_functions(content, modules_list) do
    quote do
      unquote(modules_list)
      |> Enum.reduce(unquote(content), fn step, acc ->
        step.(acc)
      end)
    end
  end

  defmacro dynamic_pipeline_modules(content, modules_list) do
    quote do
      unquote(modules_list)
      |> Enum.reduce(unquote(content), fn module, acc ->
        module.process(acc)
      end)
    end
  end

  def apply_pipeline_to_content(content, modules_list) do
    modules_list
    |> Enum.reduce(content, fn step, acc ->
      step.(acc)
    end)
  end
end
