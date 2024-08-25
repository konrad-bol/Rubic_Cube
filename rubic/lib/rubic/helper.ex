defmodule Rubic.Helper do

  def rotate_side(cube,side,clockwise?) when clockwise? == true  do
    Map.get_and_update(cube,side, fn s ->
      new_side =
      s
      |> Stream.cycle()
      |> Stream.drop(9)
      |> Enum.take(12)
      {s,new_side}
    end)
    |>elem(1)
  end
  def rotate_side(cube,side,clockwise?) when clockwise? == false  do
    Map.get_and_update(cube,side, fn s ->
      new_side =
      s
      |> Stream.cycle()
      |> Stream.drop(3)
      |> Enum.take(12)
      {s,new_side}
    end)
    |>elem(1)
  end



end
