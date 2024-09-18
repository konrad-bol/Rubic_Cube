defmodule Solver.Cross do
  alias Solver.Mover

  def make_cross(cube) do
    search_white_side(cube, number_of_good_edges(cube))
    |> search_h_down_side()
    |> search_h_middle_side()
    |> search_h_up_side()
  end

  def number_of_good_edges(cube) do
    [
      {:vertical_left_side, 1, 7},
      {:vertical_middle_side, 0, 10},
      {:vertical_middle_side, 2, 4},
      {:vertical_right_side, 1, 1}
    ]
    |> Enum.count(fn {_key, _index, index_2} ->
      Enum.at(Map.get(cube, :horizontal_down_side), index_2) ==
        Enum.at(Map.get(cube, :horizontal_middle_side), index_2)
    end)
  end

  def search_white_side(cube, x) when x in 0..3 do
    [
      {:vertical_left_side, 1, 7},
      {:vertical_middle_side, 0, 10},
      {:vertical_middle_side, 2, 4},
      {:vertical_right_side, 1, 1}
    ]
    |> Enum.reduce({cube, x}, fn {edge, index, index_2}, {cube, x} ->
      {cube, x} =
        if(Enum.at(Map.get(cube, edge), index) == :white) do
          IO.inspect("znaleziono bialy klocek na id:")
          IO.inspect({index, edge})

          {cube, x} =
            if(
              Enum.at(Map.get(cube, :horizontal_down_side), index_2) !=
                Enum.at(Map.get(cube, :horizontal_middle_side), index_2)
            ) do
              IO.inspect("jest na zlym miejscu")
              IO.inspect(x + 1)
              x = x + 1

              cube =
                Mover.move_for_white(
                  cube,
                  index_2,
                  Enum.at(Map.get(cube, :horizontal_down_side), index_2)
                )

              search_white_side(cube, x)
            else
              IO.inspect("jest na dobrym to skip")
              {cube, x}
            end
        else
          IO.inspect("nie znaleziono bialego")
          {cube, x}
        end
    end)
  end

  def search_white_side(cube, x) when x == 4, do: {cube, 4}

  def search_h_down_side({cube, x}) do
    [
      {:horizontal_down_side, 1, :vertical_right_side, 1},
      {:horizontal_down_side, 4, :vertical_middle_side, 2},
      {:horizontal_down_side, 7, :vertical_left_side, 1},
      {:horizontal_down_side, 10, :vertical_middle_side, 0}
    ]
    |> Enum.reduce({cube, x}, fn {edge, index, edge_2, index_2}, {cube, x} ->
      {cube, x} =
        if(Enum.at(Map.get(cube, edge), index) == :white) do
          IO.inspect("znaleziono bialy klocek na id:")
          IO.inspect({index, edge})

          IO.inspect("jest na zlym miejscu")
          x = x + 1

          cube =
            Mover.move_for_h_down(
              cube,
              index,
              Enum.at(Map.get(cube, edge_2), index_2)
            )

          search_h_down_side({cube, x})
        else
          IO.inspect("nie znaleziono bialego")
          {cube, x}
        end
    end)
  end

  def search_h_middle_side({cube, x}) do
    [
      {:horizontal_middle_side, 11, :horizontal_middle_side, 0},
      {:horizontal_middle_side, 2, :horizontal_middle_side, 3},
      {:horizontal_middle_side, 5, :horizontal_middle_side, 6},
      {:horizontal_middle_side, 8, :horizontal_middle_side, 9}
    ]
    |> Enum.reduce({cube, x}, fn {edge, index, edge_2, index_2}, {cube, x} ->
      {cube, x} =
        cond do
          Enum.at(Map.get(cube, edge), index) == :white ->
            IO.inspect("znaleziono bialy klocek na id:")
            IO.inspect({index, edge})

            IO.inspect("jest na zlym miejscu")
            x = x + 1

            cube =
              Mover.move_for_h_middle(
                cube,
                index,
                Enum.at(Map.get(cube, edge_2), index_2),
                :right
              )

            search_h_middle_side({cube, x})

          Enum.at(Map.get(cube, edge_2), index_2) == :white ->
            IO.inspect("znaleziono bialy klocek na id:")
            IO.inspect({index_2, edge_2})

            IO.inspect("jest na zlym miejscu")
            x = x + 1

            cube =
              Mover.move_for_h_middle(
                cube,
                index,
                Enum.at(Map.get(cube, edge), index),
                :right
              )

            search_h_middle_side({cube, x})

          true ->
            IO.inspect("nie znaleziono bialego")
            {cube, x}
        end
    end)
  end
  def search_h_up_side({cube, x}) do
    [
      {:horizontal_up_side, 1, :vertical_right_side, 7},
      {:horizontal_up_side, 4, :vertical_middle_side, 6},
      {:horizontal_up_side, 7, :vertical_left_side, 7 },
      {:horizontal_up_side, 10,:vertical_middle_side, 8}
    ]
    |> Enum.reduce({cube, x}, fn {edge, index, edge_2, index_2}, {cube, x} ->
      {cube, x} =
        cond do
          Enum.at(Map.get(cube, edge), index) == :white ->
            IO.inspect("znaleziono bialy klocek na id:")
            IO.inspect({index, edge})

            IO.inspect("jest na zlym miejscu")
            x = x + 1

            cube =
              Mover.move_for_h_up(
                cube,
                index,
                Enum.at(Map.get(cube, edge_2), index_2),
                :ver
              )

            search_h_up_side({cube, x})

          Enum.at(Map.get(cube, edge_2), index_2) == :white ->
            IO.inspect("znaleziono bialy klocek na id:")
            IO.inspect({index_2, edge_2})

            IO.inspect("jest na zlym miejscu")
            x = x + 1

            cube =
              Mover.move_for_h_up(
                cube,
                index,
                Enum.at(Map.get(cube, edge), index),
                :up
              )

              search_h_up_side({cube, x})

          true ->
            IO.inspect("nie znaleziono bialego")
            {cube, x}
        end
    end)
  end
end
