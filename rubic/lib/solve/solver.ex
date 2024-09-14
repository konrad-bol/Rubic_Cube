defmodule Solve.Solver do
  alias Rubic.Fun
  def search_edges_right(cube,color) do
    #cube=%Rubic{}|> Rubic.Fun.up()|> Rubic.Fun.up()|> Rubic.Fun.back_prime()
    vr=[:vertical_right_side,:vertical_right_side,:vertical_right_side,:vertical_right_side]
    h_list=[:horizontal_down_side,:horizontal_middle_side,:horizontal_up_side,:horizontal_middle_side]
    vr_h_index= Enum.zip([1,4,7,10],[1,2,1,0])
    Enum.zip(vr,h_list)
    |> Enum.zip_reduce(vr_h_index,[], fn {vr,h},{v_index,h_index}, place ->
        [Enum.at(Map.get(cube,vr),v_index),Enum.at(Map.get(cube,h),h_index)]
        |>Enum.find_index(&(&1==color))
        |>case do
          nil ->place ++ [:non]
          0  ->place ++ [{vr,v_index}]
          1 -> place ++ [{h,h_index}]
        end
       end)
  end
  def search_edges_left(cube,color) do
    #cube=%Rubic{}|> Rubic.Fun.up()|> Rubic.Fun.up()|> Rubic.Fun.back_prime()
    vl=[:vertical_left_side,:vertical_left_side,:vertical_left_side,:vertical_left_side]
    h_list=[:horizontal_down_side,:horizontal_middle_side,:horizontal_up_side,:horizontal_middle_side]
    vl_h_index= Enum.zip([1,4,7,10],[7,6,7,8])
    Enum.zip(vl,h_list)
    |> Enum.zip_reduce(vl_h_index,[], fn {vl,h},{v_index,h_index}, place ->
        [Enum.at(Map.get(cube,vl),v_index),Enum.at(Map.get(cube,h),h_index)]
        |> Enum.find_index(&(&1==color))
        |> case do
            nil ->place ++ [:non]
            0  ->place ++ [{vl,v_index}]
            1 -> place ++ [{h,h_index}]

          end
      end)
  end
  def search_edges_middle(cube,color) do
    v_index=[0,2,3,5,6,8,9,11]
  end
end
