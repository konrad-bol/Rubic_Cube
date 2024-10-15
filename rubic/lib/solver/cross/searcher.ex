defmodule Solver.Cross.Searcher do
  alias Solver.Cross.Mover

  def make_cross(cube) do
    copy_cube=cube
    {old_c,moves}=cube
    |> position_white_on_bottom()
    |> search_white_side( )
    |> search_h_down_side()
    |> search_h_middle_side()
    |> search_h_up_side()
    IO.inspect(moves)
    {old_c,moves}
  end
  def position_white_on_bottom(cube) do
    v_m=Map.get(cube,:vertical_middle_side)
    f_m=Map.get(cube,:front_middle_side)
    Mover.white_bottom(cube,Enum.at(v_m,1),Enum.at(v_m,4),Enum.at(f_m,4))
    #|>elem(0)
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

  def search_white_side({cube, str_moves}) do
    [
      {:vertical_left_side, 1, 7},
      {:vertical_middle_side, 0, 10},
      {:vertical_middle_side, 2, 4},
      {:vertical_right_side, 1, 1}
    ]
    |> Enum.reduce({cube, str_moves}, fn {edge, index, index_2}, {cube, str_moves} ->
      {cube, str_moves} =
        if(Enum.at(Map.get(cube, edge), index) == :white) do
          IO.inspect("znaleziono bialy klocek")

          {cube, str_moves} =
            if(
              Enum.at(Map.get(cube, :horizontal_down_side), index_2) !=
                Enum.at(Map.get(cube, :horizontal_middle_side), index_2)
            ) do
              IO.inspect("jest na zlym miejscu")

              {cube,str_moves} =
                Mover.move_for_white(
                  cube,
                  index_2,
                  Enum.at(Map.get(cube, :horizontal_down_side), index_2),
                  str_moves
                )

              search_white_side({cube, str_moves})
            else
              IO.inspect("jest na dobrym to skip")
              {cube, str_moves}
            end
        else
          IO.inspect("brak bialego")
          {cube, str_moves}
        end
    end)
  end


  def search_h_down_side({cube, str_moves}) do

    [
      {:horizontal_down_side, 1, :vertical_right_side, 1},
      {:horizontal_down_side, 4, :vertical_middle_side, 2},
      {:horizontal_down_side, 7, :vertical_left_side, 1},
      {:horizontal_down_side, 10, :vertical_middle_side, 0}
    ]

    |> Enum.reduce({cube, str_moves}, fn {edge, index, edge_2, index_2}, {cube, str_moves} ->
      {cube, str_moves} =
        if(Enum.at(Map.get(cube, edge), index) == :white) do
          IO.inspect("znaleziono bialy klocek na id:")
          IO.inspect({index, edge})

          IO.inspect("jest na zlym miejscu")


          {cube,str_moves} =
            Mover.move_for_h_down(
              cube,
              index,
              Enum.at(Map.get(cube, edge_2), index_2),
              str_moves
            )

          search_h_down_side({cube, str_moves})
        else
          {cube, str_moves}
        end
    end)

  end

  def search_h_middle_side({cube, str_moves}) do

    [
      {:horizontal_middle_side, 11, :horizontal_middle_side, 0},
      {:horizontal_middle_side, 2, :horizontal_middle_side, 3},
      {:horizontal_middle_side, 5, :horizontal_middle_side, 6},
      {:horizontal_middle_side, 8, :horizontal_middle_side, 9}
    ]
    |> Enum.reduce({cube, str_moves}, fn {edge, index, edge_2, index_2}, {cube, str_moves} ->
        cond do
          Enum.at(Map.get(cube, edge), index) == :white ->
            IO.inspect("znaleziono bialy klocek na id:")
            IO.inspect({index, edge})
            IO.inspect("jest na zlym miejscu")
            {cube,str_moves} =Mover.move_for_h_middle( cube, index, Enum.at(Map.get(cube, edge_2), index_2), :right,str_moves )
            {new_c,new_string} = search_h_middle_side({cube, str_moves})

          Enum.at(Map.get(cube, edge_2), index_2) == :white ->
            IO.inspect("znaleziono bialy klocek na id:")
            IO.inspect({index_2, edge_2})

            IO.inspect("jest na zlym miejscu")
            {cube,str_moves} =Mover.move_for_h_middle( cube, index_2, Enum.at(Map.get(cube, edge), index), :left,str_moves)
            {new_c,new_string} = search_h_middle_side({cube, str_moves})


          true ->
            {cube, str_moves}
        end
    end)
  end

  def search_h_middle_side_v2({cube, str_moves}) do
    [
      {:horizontal_middle_side, 11, :horizontal_middle_side, 0},
      {:horizontal_middle_side, 2, :horizontal_middle_side, 3},
      {:horizontal_middle_side, 5, :horizontal_middle_side, 6},
      {:horizontal_middle_side, 8, :horizontal_middle_side, 9}
    ]
    |> Enum.reduce({cube, str_moves}, fn {edge, index, edge_2, index_2}, {cube, str_moves} ->
      cond do
        Enum.at(Map.get(cube, edge), index) == :white ->
          {cube,str_moves} = Mover.move_for_h_middle(cube, index, Enum.at(Map.get(cube, edge_2), index_2), :right,str_moves)
          search_h_middle_side({cube, str_moves})

        Enum.at(Map.get(cube, edge_2), index_2) == :white ->
          {cube,str_moves} = Mover.move_for_h_middle(cube, index_2, Enum.at(Map.get(cube, edge), index), :left,str_moves)
          {new_c, new_string} = search_h_middle_side({cube, str_moves})

        true ->
          {cube, str_moves}
      end
    end)
  end

  def search_h_up_side({cube, str_moves}) do
    [
      {:horizontal_up_side, 1, :vertical_right_side, 7},
      {:horizontal_up_side, 4, :vertical_middle_side, 6},
      {:horizontal_up_side, 7, :vertical_left_side, 7 },
      {:horizontal_up_side, 10,:vertical_middle_side, 8}
    ]
    |> Enum.reduce({cube, str_moves}, fn {edge, index, edge_2, index_2}, {cube, str_moves} ->
      {cube, str_moves} =
        cond do
          Enum.at(Map.get(cube, edge), index) == :white ->
            IO.inspect("znaleziono bialy klocek na id:")
            IO.inspect({index, edge})

            IO.inspect("jest na zlym miejscu")


            {cube,str_moves} =
              Mover.move_for_h_up(
                cube,
                index,
                Enum.at(Map.get(cube, edge_2), index_2),
                :ver,
                str_moves
              )

            search_h_up_side({cube,str_moves })

          Enum.at(Map.get(cube, edge_2), index_2) == :white ->
            IO.inspect("znaleziono bialy klocek na id:")
            IO.inspect({index_2, edge_2})

            IO.inspect("jest na zlym miejscu")


            {cube,str_moves} =
              Mover.move_for_h_up(
                cube,
                index,
                Enum.at(Map.get(cube, edge), index),
                :up,
                str_moves
              )

              search_h_up_side({cube, str_moves})

          true ->
            {cube, str_moves}
        end
    end)
  end
end
