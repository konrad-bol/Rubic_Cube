defmodule Solver.UperCross.Cross do
  alias Solver.UperCross.Mover
  alias Rubic.User
  def make_upercross({cube,moves}) do
    {cube,moves}=
      {cube,moves}
    |> check_cross()
    |> permutation_cross()
  end

  def permutation_cross({cube,moves}) do
    IO.inspect("permutacja krzyza")
    h_center_up =
      Map.get(cube, :horizontal_up_side)
      |> Enum.with_index()
      |> Enum.filter(fn {_, index} -> rem(index, 3) == 1 end)
      |> Enum.map(fn {color, _} -> color end)

    h_center_mid =
      Map.get(cube, :horizontal_middle_side)
      |> Enum.with_index()
      |> Enum.filter(fn {_, index} -> rem(index, 3) == 1 end)
      |> Enum.map(fn {color, _} -> color end)

    case eq_list(h_center_mid, h_center_up, 0) do
      2 ->

        Mover.perm_line_or_L(cube, line_perm?(h_center_up, h_center_mid),moves)

      4 ->
        IO.inspect("dobry krzyz")
        {cube,moves}

      _ ->
        {cube,moves}=User.write_and_make_move(cube,moves,"U")
        permutation_cross({cube,moves})
    end
  end

  def eq_list([h | tail_1], [h | tail_2], x) do
    eq_list(tail_1, tail_2, x + 1)
  end

  def eq_list([h_1 | tail_1], [h_2 | tail_2], x) do
    eq_list(tail_1, tail_2, x)
  end

  def eq_list([], [], x) do
    x
  end

  def check_cross({cube,moves}) do
    h_center =
      Map.get(cube, :horizontal_up_side)
      |> Enum.with_index()
      |> Enum.filter(fn {_, index} -> rem(index, 3) == 1 end)
      |> Enum.map(fn {color, _} -> color end)

    case Map.get(Enum.frequencies(h_center), :yellow) do
      nil ->
        IO.inspect("to juz jest krzyz")
        {cube,moves}

      4 ->
        IO.inspect("to kropka")

        cube
        |> Mover.dot(moves)

      2 ->
        IO.inspect("linia lub L-ka")
        cube
        |> Mover.line_or_L(line?(h_center),moves)

      0 ->
        IO.inspect("to juz jest krzyz")
        {cube,moves}
    end
  end

  def line_perm?([a, _, c, _], [a, _, c, _]), do: :hor
  def line_perm?([_, b, _, d], [_, b, _, d]), do: :ver
  def line_perm?([_, _, c, d], [_, _, c, d]), do: :l_left
  def line_perm?([a, _, _, d], [a, _, _, d]), do: :l_right
  def line_perm?([a, b, _, _], [a, b, _, _]), do: :l_down_right
  def line_perm?([_, b, c, _], [_, b, c, _]), do: :l_down_left
  def line?([:yellow, _, :yellow, _]), do: :ver
  def line?([_, :yellow, _, :yellow]), do: :hor
  def line?([:yellow, :yellow, _, _]), do: :l_left
  def line?([_, :yellow, :yellow, _]), do: :l_right
  def line?([_, _, :yellow, :yellow]), do: :l_down_right
  def line?([:yellow, _, _, :yellow]), do: :l_down_left
end
