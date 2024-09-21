defmodule Solver.Middle.Searcher do
  alias Solver.Middle.Mover
  def make_2l(cube) do
    IO.inspect("zaczynamy druga warstwe")
    IO.inspect("  ")
    IO.inspect("tu:")
    cube
    |>search_up()
    |>search_mid()
  end
  def search_up(cube) do
    IO.inspect("sprawdzanie gornego paska")
    [
      {:horizontal_up_side, 1, :vertical_right_side, 7},
      {:horizontal_up_side, 4, :vertical_middle_side, 6},
      {:horizontal_up_side, 7, :vertical_left_side, 7},
      {:horizontal_up_side, 10, :vertical_middle_side, 8}
    ]
    |> Enum.reduce(cube, fn {side_ver, i, side_up, j}, cube ->
      edge = [Enum.at(Map.get(cube, side_ver), i), Enum.at(Map.get(cube, side_up), j)]

      cond do
        Enum.member?(edge, :yellow) ->
          IO.inspect("brak krawedzi bialej")
          IO.inspect(i)
          cube

        true ->
          IO.inspect("biala krawedz")
          IO.inspect(edge)
          IO.inspect(i)
          Mover.move_edge(cube, edge, i)
          |>search_up()
      end
    end)
  end

  def search_mid(cube) do
    IO.inspect("middle")
    [
      {:horizontal_middle_side, 0, 11},
      {:horizontal_middle_side, 3, 2},
      {:horizontal_middle_side, 6, 5},
      {:horizontal_middle_side, 9, 8}
    ]
    |> Enum.reduce(cube, fn {side, index_left,index_right}, cube ->
      h_m = Map.get(cube, side)
      edge = [Enum.at(h_m, index_left), Enum.at(h_m, index_right)]
      IO.inspect("sprawdzanie krawedzi srodkowych")
      IO.inspect(edge)
      IO.inspect([Enum.at(h_m, index_left + 1), Enum.at(h_m, index_right - 1)])
      cond do
        edge == [Enum.at(h_m, index_left + 1), Enum.at(h_m, index_right - 1)] ->
          IO.inspect("na poprawnej krawedzi")
          cube
        Enum.member?(edge,:yellow)->
          IO.inspect("brak bialej krawedzi")
          cube
          |>search_up()
        true ->
          IO.inspect("biala krawedz na zlym miejscu")
          Mover.move_edge_mid(cube, edge, index_left)
          |> search_mid()
      end
    end)
  end
end
