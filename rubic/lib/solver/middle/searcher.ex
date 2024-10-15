defmodule Solver.Middle.Searcher do
  alias Solver.Middle.Mover
  def make_2l({cube,moves}) do
    {cube,moves}=
      {cube,moves}
    |>search_up()
    |>search_mid()
  end
  def search_up({cube,moves}) do
    [
      {:horizontal_up_side, 1, :vertical_right_side, 7},
      {:horizontal_up_side, 4, :vertical_middle_side, 6},
      {:horizontal_up_side, 7, :vertical_left_side, 7},
      {:horizontal_up_side, 10, :vertical_middle_side, 8}
    ]
    |> Enum.reduce({cube,moves}, fn {side_ver, i, side_up, j}, {cube,moves} ->
      edge = [Enum.at(Map.get(cube, side_ver), i), Enum.at(Map.get(cube, side_up), j)]

      cond do
        Enum.member?(edge, :yellow) ->
          {cube,moves}

        true ->
          IO.inspect("znaleziono nie zolta krawedz")
          Mover.move_edge(cube, edge, i,moves)
          |>search_up()
      end
    end)
  end

  def search_mid({cube,moves}) do
    [
      {:horizontal_middle_side, 0, 11},
      {:horizontal_middle_side, 3, 2},
      {:horizontal_middle_side, 6, 5},
      {:horizontal_middle_side, 9, 8}
    ]
    |> Enum.reduce({cube,moves}, fn {side, index_left,index_right}, {cube,moves} ->
      h_m = Map.get(cube, side)
      edge = [Enum.at(h_m, index_left), Enum.at(h_m, index_right)]
      IO.inspect("sprawdzanie krawedzi srodkowych")

      cond do
        edge == [Enum.at(h_m, index_left + 1), Enum.at(h_m, index_right - 1)] ->
          IO.inspect("na poprawnej krawedzi")
          {cube,moves}
        Enum.member?(edge,:yellow)->
          IO.inspect("zółta krawedzi")
          {cube,moves}
          |>search_up()
        true ->
          IO.inspect("biala krawedz na zlym miejscu")
          Mover.move_edge_mid(cube, edge, index_left,moves)
          |> search_mid()
      end
    end)
  end
end
