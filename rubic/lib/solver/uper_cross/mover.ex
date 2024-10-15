defmodule Solver.UperCross.Mover do
  alias Rubic.User
  def dot(cube,old_m) do

    {cube,moves}={cube,old_m}
    |> algorithm_1()
    {cube,moves}=User.write_and_make_move(cube,moves,"UU")
    #|>User.multiple_move("UU")
    |>algorithm_1()
    |>algorithm_1()
  end

  def perm_line_or_L(cube,:ver,old_m) do
    {cube,old_m}
    |> algorithm_2()
    |>User.write_and_make_move("U'")
    |> algorithm_2()
    |>User.write_and_make_move("UU")
  end
  def perm_line_or_L(cube,:hor,old_m) do
    {cube,old_m}
    |> algorithm_2()
    |>User.write_and_make_move("U'")
    |> algorithm_2()

  end
  def perm_line_or_L(cube,:l_left,old_m) do
    {cube,old_m}
    |>User.write_and_make_move("U")
    |> algorithm_2()
  end
  def perm_line_or_L(cube,:l_right,old_m) do
    {cube,old_m}
    |> algorithm_2()
    |>User.write_and_make_move("U")
  end
  def perm_line_or_L(cube,:l_down_right,old_m) do
    {cube,old_m}
    |>User.write_and_make_move("U'")
    |> algorithm_2()
    |>User.write_and_make_move("UU")
  end
  def perm_line_or_L(cube,:l_down_left,old_m) do
    {cube,old_m}
    |>User.write_and_make_move("UU")
    |> algorithm_2()
    |>User.write_and_make_move("U'")
  end


  def line_or_L(cube,:ver,old_m) do
    {cube,old_m}
    |>User.write_and_make_move("U")
    |> algorithm_1()

  end
  def line_or_L(cube,:hor,old_m) do
    {cube,old_m}
    |> algorithm_1()
  end

  def line_or_L(cube,:l_left,old_m) do
    {cube,old_m}

    |> algorithm_1()
    |> algorithm_1()
  end

  def line_or_L(cube,:l_right,old_m) do
    {cube,old_m}
    |>User.write_and_make_move("U'")
    |> algorithm_1()
    |> algorithm_1()

  end
  def line_or_L(cube,:l_down_right,old_m) do
    {cube,old_m}
    |>User.write_and_make_move("UU")
    |> algorithm_1()
    |> algorithm_1()
  end
  def line_or_L(cube,:l_down_left,old_m) do
    {cube,old_m}
    |>User.write_and_make_move("U")
    |> algorithm_1()
    |> algorithm_1()
  end
  def algorithm_1({cube,old_m}) do
    {cube,old_m}
    |> User.write_and_make_move("FRUR'U'F'")
  end
  def algorithm_2({cube,old_m}) do
    {cube,old_m}
    |> User.write_and_make_move("RUR'URUUR'")
  end
end
