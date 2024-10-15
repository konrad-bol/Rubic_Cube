defmodule Solver.Corner.Mover do
  alias Rubic.User

  def move_corner(cube, {[down, right, left], index},old_m) when index > 4 do
    IO.inspect("przeniesienie w prwao Y prime")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y'")
    move_corner(cube, {[down, right, left], index - 3},moves)
  end

  def move_corner(cube, {[down, right, left], index},old_m) when index == 1 do
    IO.inspect("przeniesienie w lewo Y ")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y")
    move_corner(cube, {[down, right, left], index + 3},moves)
  end

  def move_corner(cube, {list = [down, right, left], index},old_m) when index == 4 do
    h_m = Map.get(cube, :horizontal_middle_side)
    corner_center_1 = [:white, Enum.at(h_m, 1), Enum.at(h_m, 4)]
    corner_center_2 = [:white, Enum.at(h_m, 4), Enum.at(h_m, 7)]
    corner_center_3 = [:white, Enum.at(h_m, 7), Enum.at(h_m, 10)]

    cond do

      Enum.sort(corner_center_1) == Enum.sort(list) ->
        IO.inspect("na dobrym miejscu zla permutacja")

        premutation_corner(cube, list,old_m)

      Enum.sort(corner_center_2) == Enum.sort(list) ->
        IO.inspect("trzeba przeniesc na lewo")

        {cube,moves}=User.write_and_make_move(cube,old_m,"RUR'Y'")
        #User.multiple_move(cube, "RUR'Y'")
        {cube,moves}=sexy_move(cube,1,moves)
        premutation_corner(cube,[right, left, down],moves)

      Enum.sort(corner_center_3) == Enum.sort(list) ->
        IO.inspect("trzeba przeniesc po przekatnej")

        {cube,moves}=User.write_and_make_move(cube,old_m,"RUR'UY'Y'")
        #User.multiple_move(cube, "RUR'UY'Y'")
        {cube,moves}=sexy_move(cube,1,moves)
         premutation_corner(cube,[right, left, down],moves)

      true ->
        IO.inspect("trzeba przeniesc na prawo")

        {cube,moves}=User.write_and_make_move(cube,old_m,"RUR'U'U'Y")
        #User.multiple_move(cube, "RUR'U'U'Y")
        {cube,moves}=sexy_move(cube,1,moves)
        premutation_corner(cube,[right, left, down],moves)
    end
  end
  def move_corner_up(cube, {[down, right, left], index},old_m) when index > 4 do
    IO.inspect("przeniesienie w prwao Y prime")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y'")
    move_corner_up(cube, {[down, right, left], index - 3},moves)
  end

  def move_corner_up(cube, {[down, right, left], index},old_m) when index == 1 do
    IO.inspect("przeniesienie w lewo Y ")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y")
    move_corner_up(cube, {[down, right, left], index + 3},moves)
  end
  def move_corner_up(cube, {list = [up, right, left], index},old_m) when index == 4 do
    h_m = Map.get(cube, :horizontal_middle_side)
    corner_center_1 = [:white, Enum.at(h_m, 1), Enum.at(h_m, 4)]
    corner_center_2 = [:white, Enum.at(h_m, 4), Enum.at(h_m, 7)]
    corner_center_3 = [:white, Enum.at(h_m, 7), Enum.at(h_m, 10)]

    cond do

      Enum.sort(corner_center_1) == Enum.sort(list) ->
        IO.inspect("jest nad dobrym miejscem")
        premutation_corner_up(cube, list,old_m)

      Enum.sort(corner_center_2) == Enum.sort(list) ->
        IO.inspect("trzeba przeniesc na lewo")

        {cube,moves}=User.write_and_make_move(cube,old_m,"UY'")
        #User.multiple_move(cube, "UY'")
        premutation_corner_up(cube,list,moves)

      Enum.sort(corner_center_3) == Enum.sort(list) ->
        IO.inspect("trzeba przeniesc po przekatnej")
        {cube,moves}=User.write_and_make_move(cube,old_m,"UUY'Y'")

        #User.multiple_move(cube, "UUY'Y'")
        premutation_corner_up(cube,list,moves)

      true ->
        IO.inspect("trzeba przeniesc na prawo")
        {cube,moves}=User.write_and_make_move(cube,old_m,"U'Y")

        #User.multiple_move(cube, "U'Y")
        premutation_corner_up(cube,list,moves)
    end
  end

  def premutation_corner_up(cube, list = [up, right, left],old_m) when up == :white do
    sexy_move(cube,3,old_m)
  end
  def premutation_corner_up(cube, list = [up, right, left],old_m) when right == :white do
    sexy_move(cube,1,old_m)
  end
  def premutation_corner_up(cube, list = [up, right, left],old_m) when left == :white do
    sexy_move(cube,5,old_m)
  end
  def premutation_corner(cube, list = [down, right, left],old_m) when down == :white do
    {cube,old_m}
  end
  def premutation_corner(cube, list = [down, right, left],old_m) when right == :white do
    sexy_move(cube,2,old_m)
  end
  def premutation_corner(cube, list = [down, right, left],old_m) when left == :white do
    sexy_move(cube,4,old_m)
  end

  def sexy_move(cube, i,old_m) when i > 0 do
    {cube,moves}=User.write_and_make_move(cube,old_m,"RUR'U'")
    sexy_move(cube,i - 1,moves)
  end

  def sexy_move(cube, i,old_m) when i == 0, do: {cube,old_m}
end
#SEFLLR
