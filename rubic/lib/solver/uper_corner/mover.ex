defmodule Solver.UperCorner.Mover do
  alias Rubic.User
  alias Solver.UperCorner.Corner

  def rotate_corner(cube, index,old_m) when index > 3 do
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y'")
    rotate_corner(cube, index - 3,moves)
  end

  def rotate_corner(cube, index,old_m) when index < 3 do
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y")
    rotate_corner(cube, index + 3,moves)
  end

  def rotate_corner(cube, index,old_m) when index == 3 do
    User.write_and_make_move(cube,old_m,"URU'L'UR'U'L")
    #User.multiple_move(cube, "URU'L'UR'U'L")
    |> Corner.rotate_corner()
  end

  def algorithm({cube,old_m}, x) when x > 0 do
    cube
    #|> User.multiple_move("R'D'RD")
    |>User.write_and_make_move(old_m,"R'D'RD")
    |> algorithm(x - 1)
  end

  def algorithm({cube,old_m}, 0) do
    #User.multiple_move(cube, "U'")
    User.write_and_make_move(cube,old_m,"U'")
  end
end
