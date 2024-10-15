defmodule Solver.UperCorner.Corner do
  alias Solver.UperCorner.Mover
  alias Rubic.User
  def make_corner({cube,moves}) do
    {cube,moves}={cube,moves}
    |> rotate_corner()
    |> orient_corner()
  end

  def rotate_corner({cube,moves}) do
    [
      {:vertical_right_side, 8, 11, 0},
      {:vertical_right_side, 6, 2, 3},
      {:vertical_left_side, 6, 5, 6},
      {:vertical_left_side, 8, 8, 9}
    ]
    |> Enum.zip(1..12//3)
    |> Enum.reduce({0, :non}, fn {{side, i, j, k}, index}, {x, pos} ->
      h_u = Map.get(cube, :horizontal_up_side)
      h_m = Map.get(cube, :horizontal_middle_side)
      # up right left
      list = [Enum.at(Map.get(cube, side), i), Enum.at(h_u, j), Enum.at(h_u, k)]
      corner_center_1 = [:yellow, Enum.at(h_m, rem(index + 9, 12)), Enum.at(h_m, index)]

      cond do
        Enum.sort(list) == Enum.sort(corner_center_1) ->
          {x + 1, k}

        true ->
          {x, pos}
      end
    end)
    |> case do
      {1, index_pos} -> Mover.rotate_corner(cube, index_pos,moves)
      {4, _} -> {cube,moves}
      {0, _} -> Mover.rotate_corner(cube, 3,moves)
    end
  end

  def orient_corner({cube,moves}) do
    [
      {:vertical_right_side, 6, 2, 3},
      {:vertical_right_side, 6, 2, 3},
      {:vertical_right_side, 6, 2, 3},
      {:vertical_right_side, 6, 2, 3}
    ]
    |> Enum.reduce({cube,moves}, fn {side, i, j, k}, {cube,moves} ->
      h_u = Map.get(cube, :horizontal_up_side)
      h_m = Map.get(cube, :horizontal_middle_side)

      [Enum.at(Map.get(cube, side), i), Enum.at(h_u, j), Enum.at(h_u, k)]
      |> case do
        [:yellow, _, _] -> Mover.algorithm({cube,moves}, 0)
        [_, :yellow, _] -> Mover.algorithm({cube,moves}, 2)
        [_, _, :yellow] -> Mover.algorithm({cube,moves}, 4)
      end
    end)
  end
end
