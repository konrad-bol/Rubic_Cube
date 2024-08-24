defmodule Rubic.Fun do
  alias Rubic
  alias Rubic.Construct
  alias Rubic.Helper
  def right(cube) do
    face = Map.get(cube,:red_face)
    |> Stream.cycle()
    |> Stream.drop(6)
    |> Enum.take(8)
    Map.put(cube,:red_face,face)
    side = Map.get(cube,:vertical_right_side)
    |> Stream.cycle()
    |> Stream.drop(9)
    |> Enum.take(12)
    Map.put(cube,:vertical_right_side,side)
    |> Construct.construct(:red)
  end

  def left(cube) do
    side = Map.get(cube,:vertical_left_side)
    |> Stream.cycle()
    |> Stream.drop(9)
    |> Enum.take(12)
    Map.put(cube,:vertical_left_side,side)
    |> Construct.construct(:vertical)
  end
  def up(cube) do
    side = Map.get(cube,:horizontal_up_side)
    |> Stream.cycle()
    |> Stream.drop(9)
    |> Enum.take(12)
    cube = Map.put(cube,:horizontal_up_side,side)



    list_to_updated=[[{5,9},{6,8},{7,7},{8,6},{9,5}],[{5,5},{6,6},{7,7},{8,8},{9,9}]]


    pairs=[[{:vertical_right_side,Map.get(cube,:front_back_side)},
          {:vertical_middle_side,Map.get(cube,:front_middle_side)},
          {:vertical_left_side,Map.get(cube,:front_face_side)}],
          [{:front_face_side,Map.get(cube,:vertical_left_side)},
          {:front_middle_side,Map.get(cube,:vertical_middle_side)},
          {:front_back_side,Map.get(cube,:vertical_right_side)}]]
          |> Enum.zip(list_to_updated)
    |>IO.inspect()
    #update the vertical space in "U" move
    Enum.reduce(pairs,cube, fn {pair,list},acc ->

    Enum.reduce(pair, acc,fn {to_update,source}, struct_cube ->
      Map.get_and_update(struct_cube,to_update, fn current_space->

        new_val=
        Enum.zip_reduce(list, current_space, current_space, fn {index_to_update,index_of_source},_, acc ->
          acc = List.replace_at(acc,index_to_update,Enum.at(source,index_of_source))
        end)
        {current_space,new_val}
      end)
      |> elem(1)
    end)
  end)

#   Enum.reduce(pair_2, cube,fn {f,v}, c ->
#     Map.get_and_update(c,f, fn current->
#       new_val=
#       Enum.zip_reduce(f_up,current, current, fn {i,j},val, acc ->
#         acc = List.replace_at(acc,i,Enum.at(v,j))
#       end)
#       {current,new_val}
#     end)
#     |> elem(1)
#   end)

  end

  def front(cube) do
    side = Map.get(cube,:front_face_side)
    |> Stream.cycle()
    |> Stream.drop(9)
    |> Enum.take(12)
    cube = Map.put(cube,:front_face_side,side)

    copy_V_r= Map.get(cube,:vertical_right_side)
    copy_V_m= Map.get(cube,:vertical_middle_side)
    copy_V_l= Map.get(cube,:vertical_left_side)

    v_up=[{2,2},{3,3},{4,4},{5,5},{6,6}]
    h_up=[{2,6},{3,5},{4,4},{5,3},{6,2}]

    pair=[{:vertical_right_side,:horizontal_up_side},
          {:vertical_middle_side,:horizontal_middle_side},
          {:vertical_left_side,:horizontal_down_side}]
    pair_2=[{:horizontal_up_side,copy_V_l},
          {:horizontal_middle_side,copy_V_m},
          {:horizontal_down_side,copy_V_r}]
    #update the vertical space in "U" move
    cube =
    Enum.reduce(pair, cube,fn {v,h}, c ->
      Map.get_and_update(c,v, fn current->
        h_b= Map.get(c,h)
        new_val=
        Enum.zip_reduce(v_up,current, current, fn {i,j},val, acc ->
          acc = List.replace_at(acc,i,Enum.at(h_b,j))
        end)
        {current,new_val}
      end)
      |> elem(1)
    end)

    Enum.reduce(pair_2, cube,fn {h,v}, c ->
      Map.get_and_update(c,h, fn current->
        new_val=
        Enum.zip_reduce(h_up,current, current, fn {i,j},val, acc ->
          acc = List.replace_at(acc,i,Enum.at(v,j))
        end)
        {current,new_val}
      end)
      |> elem(1)
    end)
  end


end
