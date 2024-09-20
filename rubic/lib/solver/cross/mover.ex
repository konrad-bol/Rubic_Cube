defmodule Solver.Cross.Mover do
  alias Rubic.User

  def white_bottom(cube, :white, _, _), do: cube
  def white_bottom(cube, _, :white, _), do: Rubic.Fun.x_move_prime(cube)
  def white_bottom(cube, _, _, :white), do: Rubic.Fun.z_move_prime(cube)
  def white_bottom(cube, _, _, :yellow), do: Rubic.Fun.z_move(cube)
  def white_bottom(cube, :yellow, _, _), do: User.multiple_move(cube, "XX")
  def white_bottom(cube, _, :yellow, _), do: User.multiple_move(cube, "X")

  def move_for_white(cube, index, color) when index > 5 do
    IO.inspect("przesuniecie kostki w prawo Y prime")
    move_for_white(Rubic.Fun.y_move_prime(cube), index - 3, color)
  end

  def move_for_white(cube, index, color) when index < 3 do
    IO.inspect("przesuniecie kostki w lewo Y")
    move_for_white(Rubic.Fun.y_move(cube), index + 3, color)
  end

  def move_for_white(cube, index, color) when index in 3..5 do
    id_left = rem(index + 3, 12)
    id_right = rem(index - 3, 12)

    id_back = rem(index - 6, 12)
    IO.inspect(color)
    cond do
      Enum.at(Map.get(cube, :horizontal_middle_side), index) == color ->
        IO.inspect("git")
        cube

      Enum.at(Map.get(cube, :horizontal_middle_side), id_right) == color ->
        IO.inspect("przeniesienie na prawo")
        User.multiple_move(cube, "FD'F'D")

      Enum.at(Map.get(cube, :horizontal_middle_side), id_left) == color ->
        IO.inspect("przeniesienie w lego")
        User.multiple_move(cube, "FDF'D'")

      Enum.at(Map.get(cube, :horizontal_middle_side), id_back) == color ->
        IO.inspect("przeniesienie do tylu")
        User.multiple_move(cube, "FDDF'DD")
    end
  end

  def move_for_h_down(cube, index, color) when index > 5 do
    IO.inspect("przesuniecie kostki w prawo Y prime")
    move_for_h_down(Rubic.Fun.y_move_prime(cube), index - 3, color)
  end

  def move_for_h_down(cube, index, color) when index < 3 do
    IO.inspect("przesuniecie kostki w lewo Y")
    move_for_h_down(Rubic.Fun.y_move(cube), index + 3, color)
  end

  def move_for_h_down(cube, index, color) when index in 3..5 do
    IO.inspect(color)
    cond do
      Enum.at(Map.get(cube, :horizontal_middle_side), 4) == color ->
        IO.inspect("obrot ")
        User.multiple_move(cube, "FD'LD")

      Enum.at(Map.get(cube, :horizontal_middle_side), 1) == color ->
        IO.inspect("przeniesienie na prawo")
        User.multiple_move(cube, "F'R'DRD'")

      Enum.at(Map.get(cube, :horizontal_middle_side), 7) == color ->
        IO.inspect("przeniesienie w lego")
        User.multiple_move(cube, "FLD'L'D")

      Enum.at(Map.get(cube, :horizontal_middle_side), 10) == color ->
        IO.inspect("przeniesienie do tylu")
        User.multiple_move(cube, "FDLD'D'L'D")
    end
  end

  def move_for_h_middle(cube, index, color, side_looking)
      when index > 5 and side_looking == :right do
    IO.inspect("przesuniecie kostki w prawo Y prime")
    move_for_h_middle(Rubic.Fun.y_move_prime(cube), index - 3, color, side_looking)
  end

  def move_for_h_middle(cube, index, color, side_looking)
      when index < 5 and side_looking == :right do
    IO.inspect("przesuniecie kostki w lewo Y")
    move_for_h_middle(Rubic.Fun.y_move(cube), index + 3, color, side_looking)
  end

  def move_for_h_middle(cube, index, color, side_looking)
      when index > 3 and side_looking == :left do
    IO.inspect("przesuniecie kostki w prawo Y prime")
    move_for_h_middle(Rubic.Fun.y_move_prime(cube), index - 3, color, side_looking)
  end

  def move_for_h_middle(cube, index, color, side_looking)
      when index < 3 and side_looking == :left do
    IO.inspect("przesuniecie kostki w lewo Y")
    move_for_h_middle(Rubic.Fun.y_move(cube), index + 3, color, side_looking)
  end

  def move_for_h_middle(cube, index, color, side_looking)
      when side_looking == :left and index == 3 do
        IO.inspect(color)
    cube =
      cond do
        Enum.at(Map.get(cube, :horizontal_middle_side), 4) == color ->
          IO.inspect("przeniesienie na przod (patrzy w lewo) ")
          User.multiple_move(cube, "DR'D'")

        Enum.at(Map.get(cube, :horizontal_middle_side), 1) == color ->
          IO.inspect("przeniesienie na prawo")
          User.multiple_move(cube, "R'")

        Enum.at(Map.get(cube, :horizontal_middle_side), 7) == color ->
          IO.inspect("przeniesienie w lego")
          User.multiple_move(cube, "RUR'ULL")

        Enum.at(Map.get(cube, :horizontal_middle_side), 10) == color ->
          IO.inspect("przeniesienie do tylu")
          User.multiple_move(cube, "RU'R'BB")
      end
  end

  def move_for_h_middle(cube, index, color, side_looking)
      when side_looking == :right and index == 5 do
    IO.inspect(color)
    cond do
      Enum.at(Map.get(cube, :horizontal_middle_side), 4) == color ->
        IO.inspect("obrot ")
        User.multiple_move(cube, "D'LD")

      Enum.at(Map.get(cube, :horizontal_middle_side), 1) == color ->
        IO.inspect("przeniesienie na prawo")
        User.multiple_move(cube, "L'U'LU'RR")

      Enum.at(Map.get(cube, :horizontal_middle_side), 7) == color ->
        IO.inspect("przeniesienie w lego")
        Rubic.Fun.left(cube)

      Enum.at(Map.get(cube, :horizontal_middle_side), 10) == color ->
        IO.inspect("przeniesienie do tylu")
        User.multiple_move(cube, "L'ULBB")
    end
  end

  def move_for_h_up(cube, index, color, side_looking) when index > 4 do
    IO.inspect("przesuniecie kostki w prawo Y prime")
    move_for_h_up(Rubic.Fun.y_move_prime(cube), index - 3, color, side_looking)
  end

  def move_for_h_up(cube, index, color, side_looking) when index < 4 do
    IO.inspect("przesuniecie kostki w lewo Y")
    move_for_h_up(Rubic.Fun.y_move(cube), index + 3, color, side_looking)
  end

  def move_for_h_up(cube, index, color, side_looking) when side_looking == :ver and index == 4 do
    IO.inspect(color)
    cond do
      Enum.at(Map.get(cube, :horizontal_middle_side), 4) == color ->
        IO.inspect("obrot ")
        User.multiple_move(cube, "U'R'FR")

      Enum.at(Map.get(cube, :horizontal_middle_side), 1) == color ->
        IO.inspect("przeniesienie na prawo")
        User.multiple_move(cube, "FR'F'")

      Enum.at(Map.get(cube, :horizontal_middle_side), 7) == color ->
        IO.inspect("przeniesienie w lego")
        User.multiple_move(cube, "F'LF")

      Enum.at(Map.get(cube, :horizontal_middle_side), 10) == color ->
        IO.inspect("przeniesienie do tylu")
        User.multiple_move(cube, "U'RB'R'")
    end
  end

  def move_for_h_up(cube, index, color, side_looking) when side_looking == :up and index == 4 do
    IO.inspect(color)
    cond do
      Enum.at(Map.get(cube, :horizontal_middle_side), 4) == color ->
        IO.inspect("obrot ")
        User.multiple_move(cube, "FF")

      Enum.at(Map.get(cube, :horizontal_middle_side), 1) == color ->
        IO.inspect("przeniesienie na prawo")
        User.multiple_move(cube, "URR")

      Enum.at(Map.get(cube, :horizontal_middle_side), 7) == color ->
        IO.inspect("przeniesienie w lego")
        User.multiple_move(cube, "U'LL")

      Enum.at(Map.get(cube, :horizontal_middle_side), 10) == color ->
        IO.inspect("przeniesienie do tylu")
        User.multiple_move(cube, "UUBB")
    end
  end
end
