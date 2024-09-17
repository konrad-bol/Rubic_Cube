defmodule Solver.Cross do
  def search_white_side(cube, x) do
    [{:vertical_left_side,1,7},{:vertical_middle_side,0,10},{:vertical_middle_side,2,4},{:vertical_right_side,1,1}]
    |> Enum.reduce({cube,x},fn {edge,index,index_2}, {cube,x} ->
      if(Enum.at(Map.get(cube,edge),index)== :white) do
        if(Enum.at(Map.get(cube,:horizontal_middle_side),index_2)!=Enum.at(Map.get(cube,:horizontal_middle_side),index_2)) do
          x=x+1
          cube=move_for_white(cube,index_2,Enum.at(Map.get(cube,:horizontal_middle_side),index_2))
          search_white_side(cube,x)
        end
      end
    end)
  end
end
