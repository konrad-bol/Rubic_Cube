defmodule Rubic.Fun do
  alias Rubic
  #alias Rubic.Construct
  alias Rubic.Helper
  def right(cube) do
    cube = Helper.rotate_side(cube,:vertical_right_side,true)
    list_to_updated=[[{0,9},{1,10},{2,11},{3,0},{11,8}],[{0,11},{8,3},{9,2},{10,1},{11,0}]]

    pairs=[[{:horizontal_up_side,Map.get(cube,:front_face_side)},
    {:horizontal_middle_side,Map.get(cube,:front_middle_side)},
    {:horizontal_down_side,Map.get(cube,:front_back_side)}],
    [{:front_face_side,Map.get(cube,:horizontal_down_side)},
    {:front_middle_side,Map.get(cube,:horizontal_middle_side)},
    {:front_back_side,Map.get(cube,:horizontal_up_side)}]]
    |> Enum.zip(list_to_updated)

    Enum.reduce(pairs,cube, fn {pair,list},struct_cube ->

      Enum.reduce(pair, struct_cube,fn {to_update,source}, struct_rubic ->

        Map.get_and_update(struct_rubic ,to_update, fn current_space->
          new_val =
          Enum.zip_reduce(list, current_space, current_space, fn {index_to_update,index_of_source},_, acc ->
            List.replace_at(acc,index_to_update,Enum.at(source,index_of_source))
          end)
          {current_space,new_val}
        end)
        |> elem(1)
      end)
    end)
  end

  def left(cube) do
    cube = Helper.rotate_side(cube,:vertical_left_side,true)
    list_to_updated=[[{5,2},{6,5},{7,4},{8,3},{9,6}],[{2,9},{3,8},{4,7},{5,6},{6,5}]]

    pairs=[[{:horizontal_down_side,Map.get(cube,:front_face_side)},
    {:horizontal_middle_side,Map.get(cube,:front_middle_side)},
    {:horizontal_up_side,Map.get(cube,:front_back_side)}],
    [{:front_face_side,Map.get(cube,:horizontal_up_side)},
    {:front_middle_side,Map.get(cube,:horizontal_middle_side)},
    {:front_back_side,Map.get(cube,:horizontal_down_side)}]]
    |> Enum.zip(list_to_updated)

    Enum.reduce(pairs,cube, fn {pair,list},struct_cube ->

      Enum.reduce(pair, struct_cube,fn {to_update,source}, struct_rubic ->

        Map.get_and_update(struct_rubic ,to_update, fn current_space->
          new_val =
          Enum.zip_reduce(list, current_space, current_space, fn {index_to_update,index_of_source},_, acc ->
            List.replace_at(acc,index_to_update,Enum.at(source,index_of_source))
          end)
          {current_space,new_val}
        end)
        |> elem(1)
      end)
    end)
  end

  def up(cube) do
    #rotate first space (horizontal up)
    cube = Helper.rotate_side(cube,:horizontal_up_side,true)

    #list of tuples which elements will need replacement
    # first element in tuple is index of element that need to be update
    #second element is index of element which is correct ( in other space the 5 element of vertical right side will be replace with
    #9 element of front back side space )
    list_to_updated=[[{5,9},{6,8},{7,7},{8,6},{9,5}],[{5,5},{6,6},{7,7},{8,8},{9,9}]]

    pairs=[[{:vertical_right_side,Map.get(cube,:front_back_side)},
          {:vertical_middle_side,Map.get(cube,:front_middle_side)},
          {:vertical_left_side,Map.get(cube,:front_face_side)}],
          [{:front_face_side,Map.get(cube,:vertical_right_side)},
          {:front_middle_side,Map.get(cube,:vertical_middle_side)},
          {:front_back_side,Map.get(cube,:vertical_left_side)}]]
          |> Enum.zip(list_to_updated)

    #update the vertical space in "U" move
    Enum.reduce(pairs,cube, fn {pair,list},struct_cube ->

      Enum.reduce(pair, struct_cube,fn {to_update,source}, struct_rubic ->

        Map.get_and_update(struct_rubic ,to_update, fn current_space->
          new_val =
          Enum.zip_reduce(list, current_space, current_space, fn {index_to_update,index_of_source},_, acc ->
            List.replace_at(acc,index_to_update,Enum.at(source,index_of_source))
          end)
          {current_space,new_val}
        end)
        |> elem(1)
      end)
    end)
  end

  def down(cube) do
    cube = Helper.rotate_side(cube,:horizontal_down_side,false)

    list_to_updated=[[{0,0},{1,1},{2,2},{3,3},{11,11}],[{0,2},{1,1},{2,0},{3,11},{11,3}]]

    pairs=[[{:vertical_right_side,Map.get(cube,:front_face_side)},
          {:vertical_middle_side,Map.get(cube,:front_middle_side)},
          {:vertical_left_side,Map.get(cube,:front_back_side)}],
          [{:front_face_side,Map.get(cube,:vertical_left_side)},
          {:front_middle_side,Map.get(cube,:vertical_middle_side)},
          {:front_back_side,Map.get(cube,:vertical_right_side)}]]
          |> Enum.zip(list_to_updated)


    Enum.reduce(pairs,cube, fn {pair,list},struct_cube ->

      Enum.reduce(pair, struct_cube,fn {to_update,source}, struct_rubic ->

        Map.get_and_update(struct_rubic ,to_update, fn current_space->
          new_val =
          Enum.zip_reduce(list, current_space, current_space, fn {index_to_update,index_of_source},_, acc ->
             List.replace_at(acc,index_to_update,Enum.at(source,index_of_source))
          end)
          {current_space,new_val}
        end)
        |> elem(1)
      end)
    end)

  end

  def front(cube) do
    cube = Helper.rotate_side(cube,:front_face_side,true)

    list_to_updated=[[{2,2},{3,3},{4,4},{5,5},{6,6}],[{2,6},{3,5},{4,4},{5,3},{6,2}]]

    pairs=[[{:vertical_right_side,Map.get(cube,:horizontal_up_side)},
    {:vertical_middle_side,Map.get(cube,:horizontal_middle_side)},
    {:vertical_left_side,Map.get(cube,:horizontal_down_side)}],
    [{:horizontal_up_side,Map.get(cube,:vertical_left_side)},
    {:horizontal_middle_side,Map.get(cube,:vertical_middle_side)},
    {:horizontal_down_side,Map.get(cube,:vertical_right_side)}]]
    |> Enum.zip(list_to_updated)

    Enum.reduce(pairs,cube, fn {pair,list},struct_cube ->

      Enum.reduce(pair, struct_cube,fn {to_update,source}, struct_rubic ->

        Map.get_and_update(struct_rubic ,to_update, fn current_space->
          new_val =
          Enum.zip_reduce(list, current_space, current_space, fn {index_to_update,index_of_source},_, acc ->
            List.replace_at(acc,index_to_update,Enum.at(source,index_of_source))
          end)
          {current_space,new_val}
        end)
        |> elem(1)
      end)
    end)


  end

  def back(cube) do
    cube = Helper.rotate_side(cube,:front_back_side,false)

    list_to_updated=[[{0,8},{8,0},{9,11},{10,10},{11,9}],[{0,0},{8,8},{9,9},{10,10},{11,11}]]

    pairs=[[{:vertical_right_side,Map.get(cube,:horizontal_down_side)},
    {:vertical_middle_side,Map.get(cube,:horizontal_middle_side)},
    {:vertical_left_side,Map.get(cube,:horizontal_up_side)}],
    [{:horizontal_up_side,Map.get(cube,:vertical_right_side)},
    {:horizontal_middle_side,Map.get(cube,:vertical_middle_side)},
    {:horizontal_down_side,Map.get(cube,:vertical_left_side)}]]
    |> Enum.zip(list_to_updated)

    Enum.reduce(pairs,cube, fn {pair,list},struct_cube ->

      Enum.reduce(pair, struct_cube,fn {to_update,source}, struct_rubic ->

        Map.get_and_update(struct_rubic ,to_update, fn current_space->
          new_val =
          Enum.zip_reduce(list, current_space, current_space, fn {index_to_update,index_of_source},_, acc ->
            List.replace_at(acc,index_to_update,Enum.at(source,index_of_source))
          end)
          {current_space,new_val}
        end)
        |> elem(1)
      end)
    end)
  end


end
