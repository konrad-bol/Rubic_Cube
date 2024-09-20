defmodule Solver.Corner.Mover do
  alias Rubic.User

  def move_corner(cube, {[down, right, left], index}) when index > 4 do
    IO.inspect("przeniesienie w prwao Y prime")
    move_corner(Rubic.Fun.y_move_prime(cube), {[down, right, left], index - 3})
  end

  def move_corner(cube, {[down, right, left], index}) when index == 1 do
    IO.inspect("przeniesienie w lewo Y ")
    move_corner(Rubic.Fun.y_move(cube), {[down, right, left], index + 3})
  end

  def move_corner(cube, {list = [down, right, left], index}) when index == 4 do
    h_m = Map.get(cube, :horizontal_middle_side)
    corner_center_1 = [:white, Enum.at(h_m, 1), Enum.at(h_m, 4)]
    corner_center_2 = [:white, Enum.at(h_m, 4), Enum.at(h_m, 7)]
    corner_center_3 = [:white, Enum.at(h_m, 7), Enum.at(h_m, 10)]

    cond do

      Enum.sort(corner_center_1) == Enum.sort(list) ->
        IO.inspect("na dobrym miejscu zla permutacja")
        premutation_corner(cube, list)

      Enum.sort(corner_center_2) == Enum.sort(list) ->
        IO.inspect("trzeba przeniesc na lewo")

        User.multiple_move(cube, "RUR'Y'")
        |> sexy_move(1)
        |> premutation_corner([right, left, down])

      Enum.sort(corner_center_3) == Enum.sort(list) ->
        IO.inspect("trzeba przeniesc po przekatnej")

        User.multiple_move(cube, "RUR'UY'Y'")
        |> sexy_move(1)
        |> premutation_corner([right, left, down])

      true ->
        IO.inspect("trzeba przeniesc na prawo")

        User.multiple_move(cube, "RUR'U'U'Y")
        |> sexy_move(1)
        |> premutation_corner([right, left, down])
    end
  end
  def move_corner_up(cube, {[down, right, left], index}) when index > 4 do
    IO.inspect("przeniesienie w prwao Y prime")
    move_corner_up(Rubic.Fun.y_move_prime(cube), {[down, right, left], index - 3})
  end

  def move_corner_up(cube, {[down, right, left], index}) when index == 1 do
    IO.inspect("przeniesienie w lewo Y ")
    move_corner_up(Rubic.Fun.y_move(cube), {[down, right, left], index + 3})
  end
  def move_corner_up(cube, {list = [up, right, left], index}) when index == 4 do
    h_m = Map.get(cube, :horizontal_middle_side)
    corner_center_1 = [:white, Enum.at(h_m, 1), Enum.at(h_m, 4)]
    corner_center_2 = [:white, Enum.at(h_m, 4), Enum.at(h_m, 7)]
    corner_center_3 = [:white, Enum.at(h_m, 7), Enum.at(h_m, 10)]

    cond do

      Enum.sort(corner_center_1) == Enum.sort(list) ->
        IO.inspect("jest nad dobrym miejscem")
        premutation_corner_up(cube, list)

      Enum.sort(corner_center_2) == Enum.sort(list) ->
        IO.inspect("trzeba przeniesc na lewo")

        User.multiple_move(cube, "UY'")
        |> premutation_corner_up(list)

      Enum.sort(corner_center_3) == Enum.sort(list) ->
        IO.inspect("trzeba przeniesc po przekatnej")

        User.multiple_move(cube, "UUY'Y'")
        |> premutation_corner_up(list)

      true ->
        IO.inspect("trzeba przeniesc na prawo")
        User.multiple_move(cube, "U'Y")
        |> premutation_corner_up(list)
    end
  end

  def premutation_corner_up(cube, list = [up, right, left]) when up == :white do
    sexy_move(cube,3)
  end
  def premutation_corner_up(cube, list = [up, right, left]) when right == :white do
    sexy_move(cube,1)
  end
  def premutation_corner_up(cube, list = [up, right, left]) when left == :white do
    sexy_move(cube,5)
  end
  def premutation_corner(cube, list = [down, right, left]) when down == :white do
    cube
  end
  def premutation_corner(cube, list = [down, right, left]) when right == :white do
    sexy_move(cube,2)
  end
  def premutation_corner(cube, list = [down, right, left]) when left == :white do
    sexy_move(cube,4)
  end

  def sexy_move(cube, i) when i > 0 do
    cube
    |> User.multiple_move("RUR'U'")
    |> sexy_move(i - 1)
  end

  def sexy_move(cube, i) when i == 0, do: cube
end
