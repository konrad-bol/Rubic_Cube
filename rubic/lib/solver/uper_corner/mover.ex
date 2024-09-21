defmodule Solver.UperCorner.Mover do
  alias Rubic.User
  alias Solver.UperCorner.Corner

  def rotate_corner(cube, index) when index > 3 do
    rotate_corner(User.multiple_move(cube, "Y'"), index - 3)
  end

  def rotate_corner(cube, index) when index < 3 do
    rotate_corner(User.multiple_move(cube, "Y"), index + 3)
  end

  def rotate_corner(cube, index) when index == 3 do
    User.multiple_move(cube, "URU'L'UR'U'L")
    |> Corner.rotate_corner()
  end

  def algorithm(cube, x) when x > 0 do
    cube
    |> User.multiple_move("R'D'RD")
    |> algorithm(x - 1)
  end

  def algorithm(cube, 0) do
    User.multiple_move(cube, "U'")
  end
end
