defmodule MacrosPlaygroundTest do
  use ExUnit.Case
  doctest MacrosPlayground

  test "greets the world" do
    assert MacrosPlayground.hello() == :world
  end
end
