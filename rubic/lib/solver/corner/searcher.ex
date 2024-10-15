defmodule Solver.Corner.Searcher do
  alias Solver.Corner.Mover
  # search for white corners on white side in any permutation
  def make_corner({cube,old_m}) do
    {cube,old_m}
    |> search_white_corner()
    |> search_white_corner_up()
  end
  def search_white_corner({cube,moves}) do
    [
      {:vertical_right_side, 0, 11, 0},
      {:vertical_right_side, 2, 2, 3},
      {:vertical_left_side, 2, 5, 6},
      {:vertical_left_side, 0, 8, 9}
    ]

    |> Enum.zip(1..12//3)
    |> Enum.reduce({cube,moves},fn {{side,i,j,k}, index},{cube,moves} ->

      h_d = Map.get(cube, :horizontal_down_side)
      h_m = Map.get(cube, :horizontal_middle_side)
      list= [Enum.at(Map.get(cube,side), i), Enum.at(h_d, j), Enum.at(h_d, k)]


      corner_center_1=[:white, Enum.at(h_m, rem(index+9,12)), Enum.at(h_m, index)]
      cond do
        corner_center_1==list-> IO.inspect("na dobrej pozycji bialy")
        {cube,moves}

        Enum.any?(list, &(&1 == :white)) -> IO.inspect("bialy naroznik na zlym miejscu")
        Mover.move_corner(cube,{list,index},moves)
        |>search_white_corner()

        true->
          {cube,moves}
      end
    end)
  end

  def search_white_corner_up({cube,moves}) do


    [
      {:vertical_right_side, 8, 11, 0},
      {:vertical_right_side, 6, 2, 3},
      {:vertical_left_side, 6, 5, 6},
      {:vertical_left_side, 8, 8, 9}
    ]

    |> Enum.zip(1..12//3)
    |> Enum.reduce({cube,moves},fn {{side,i,j,k}, index},{cube,moves} ->


      h_u = Map.get(cube, :horizontal_up_side)
      h_m = Map.get(cube, :horizontal_middle_side)
      list= [Enum.at(Map.get(cube,side), i), Enum.at(h_u, j), Enum.at(h_u, k)]


      corner_center_1=[:white, Enum.at(h_m, rem(index+9,12)), Enum.at(h_m, index)]

      cond do

        Enum.any?(list, &(&1 == :white)) -> IO.inspect("bialy naroznik na zlym miejscu")
        IO.inspect(index)
        Mover.move_corner_up(cube,{list,index},moves)
        |>search_white_corner_up()

        true->
          {cube,moves}
      end
    end)
  end
end
