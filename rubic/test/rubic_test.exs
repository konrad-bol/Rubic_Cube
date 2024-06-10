defmodule RubicTest do
  use ExUnit.Case
  doctest Rubic

  test "greets the world" do
    assert Rubic.hello() == :world
  end
end
