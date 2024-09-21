defmodule Solver.UperCross.Mover do
  alias Rubic.User
  def dot(cube) do
    cube
    |> algorithm_1()
    |>User.multiple_move("UU")
    |> algorithm_1()
    |> algorithm_1()
  end



  def perm_line_or_L(cube,:ver) do
    cube
    |> algorithm_2()
    |>User.multiple_move("U'")
    |> algorithm_2()
    |>User.multiple_move("UU")
  end
  def perm_line_or_L(cube,:hor) do
    cube
    |> algorithm_2()
    |>User.multiple_move("U'")
    |> algorithm_2()

  end
  def perm_line_or_L(cube,:l_left) do
    cube
    |>User.multiple_move("U")
    |> algorithm_2()
  end
  def perm_line_or_L(cube,:l_right) do
    cube
    |> algorithm_2()
    |>User.multiple_move("U")
  end
  def perm_line_or_L(cube,:l_down_right) do
    cube
    |>User.multiple_move("U'")
    |> algorithm_2()
    |>User.multiple_move("UU")
  end
  def perm_line_or_L(cube,:l_down_left) do
    cube
    |>User.multiple_move("UU")
    |> algorithm_2()
    |>User.multiple_move("U'")
  end


  def line_or_L(cube,:ver) do
    cube
    |>User.multiple_move("U")
    |> algorithm_1()

  end
  def line_or_L(cube,:hor) do
    cube
    |> algorithm_1()
  end

  def line_or_L(cube,:l_left) do
    cube

    |> algorithm_1()
    |> algorithm_1()
  end

  def line_or_L(cube,:l_right) do
    cube
    |>User.multiple_move("U'")
    |> algorithm_1()
    |> algorithm_1()

  end
  def line_or_L(cube,:l_down_right) do
    cube
    |>User.multiple_move("UU")
    |> algorithm_1()
    |> algorithm_1()
  end
  def line_or_L(cube,:l_down_left) do
    cube
    |>User.multiple_move("U")
    |> algorithm_1()
    |> algorithm_1()
  end
  def algorithm_1(cube) do
    cube
    |> User.multiple_move("FRUR'U'F'")
  end
  def algorithm_2(cube) do
    cube
    |> User.multiple_move("RUR'URUUR'")
  end
end
