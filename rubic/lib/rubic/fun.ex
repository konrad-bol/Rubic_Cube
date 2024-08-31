defmodule Rubic.Fun do
  alias Rubic
  #alias Rubic.Construct
  alias Rubic.Helper
  def right(cube) do
    cube = Helper.rotate_side(cube,:vertical_right_side,true)
    list_to_updated=Helper.create_lists(:right)
    Helper.get_pairs(:right,cube)
    |> Enum.zip(list_to_updated)
    |> update_sides(cube)
  end

  def left(cube) do
    cube = Helper.rotate_side(cube,:vertical_left_side,false)
    list_to_updated=Helper.create_lists(:left)
    Helper.get_pairs(:left,cube)
    |> Enum.zip(list_to_updated)
    |>update_sides(cube)
  end

  def up(cube) do
    cube = Helper.rotate_side(cube,:horizontal_up_side,true)
    list_to_updated=Helper.create_lists(:up)
    Helper.get_pairs(:up,cube)
    |> Enum.zip(list_to_updated)
    |> update_sides(cube)
  end

  def down(cube) do
    cube = Helper.rotate_side(cube,:horizontal_down_side,false)
    list_to_updated = Helper.create_lists(:down)
    Helper.get_pairs(:down,cube)
    |> Enum.zip(list_to_updated)
    |> update_sides(cube)
  end

  def front(cube) do
    cube = Helper.rotate_side(cube,:front_face_side,true)
    list_to_updated=Helper.create_lists(:front)
    Helper.get_pairs(:front,cube)
    |> Enum.zip(list_to_updated)
    |>update_sides(cube)
  end

  def back(cube) do
    cube = Helper.rotate_side(cube,:front_back_side,false)
    list_to_updated=Helper.create_lists(:back)
    Helper.get_pairs(:back,cube)
    |> Enum.zip(list_to_updated)
    |>update_sides(cube)
  end

  def update_sides(pairs,cube) do
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
