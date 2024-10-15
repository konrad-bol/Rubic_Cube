defmodule Solver.Cross.Mover do
  alias Rubic.User

  def white_bottom(cube, :white, _, _), do: {cube,""}
  def white_bottom(cube, _, :white, _), do: User.write_and_make_move(cube,"","X'")
  def white_bottom(cube, _, _, :white), do: User.write_and_make_move(cube,"","Z'")
  def white_bottom(cube, _, _, :yellow), do: User.write_and_make_move(cube,"","Z")
  def white_bottom(cube, :yellow, _, _), do: User.write_and_make_move(cube,"", "XX")
  def white_bottom(cube, _, :yellow, _), do: User.write_and_make_move(cube,"", "X")

  def move_for_white(cube, index, color,old_m) when index > 5 do
    IO.inspect("przesuniecie kostki w prawo Y prime")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y'")
    move_for_white(cube, index - 3, color,moves)
  end

  def move_for_white(cube, index, color,old_m) when index < 3 do
    IO.inspect("przesuniecie kostki w lewo Y")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y")
    move_for_white(Rubic.Fun.y_move(cube), index + 3, color,moves)
  end

  def move_for_white(cube, index, color,old_m) when index in 3..5 do
    id_left = rem(index + 3, 12)
    id_right = rem(index - 3, 12)
    id_back = rem(index - 6, 12)
    IO.inspect(color)
    {cube,moves}
    =cond do
      Enum.at(Map.get(cube, :horizontal_middle_side), index) == color ->
        IO.inspect("git")
        {cube,old_m}

      Enum.at(Map.get(cube, :horizontal_middle_side), id_right) == color ->
        IO.inspect("przeniesienie na prawo")
        User.write_and_make_move(cube,old_m, "FD'F'D")

      Enum.at(Map.get(cube, :horizontal_middle_side), id_left) == color ->
        IO.inspect("przeniesienie w lego")
        User.write_and_make_move(cube,old_m, "FDF'D'")

      Enum.at(Map.get(cube, :horizontal_middle_side), id_back) == color ->
        IO.inspect("przeniesienie do tylu")
        User.write_and_make_move(cube,old_m, "FDDF'DD")
    end
  end

  def move_for_h_down(cube, index, color,old_m) when index > 5 do
    IO.inspect("przesuniecie kostki w prawo Y prime")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y'")
    move_for_h_down(cube, index - 3, color,moves)
  end

  def move_for_h_down(cube, index, color,old_m) when index < 3 do
    IO.inspect("przesuniecie kostki w lewo Y")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y")
    move_for_h_down(cube, index + 3, color,moves)
  end

  def move_for_h_down(cube, index, color,old_m) when index in 3..5 do
    IO.inspect(color)
    cond do
      Enum.at(Map.get(cube, :horizontal_middle_side), 4) == color ->
        IO.inspect("obrot ")
        User.write_and_make_move(cube,old_m, "FD'LD")

      Enum.at(Map.get(cube, :horizontal_middle_side), 1) == color ->
        IO.inspect("przeniesienie na prawo")
        User.write_and_make_move(cube,old_m, "F'R'DRD'")

      Enum.at(Map.get(cube, :horizontal_middle_side), 7) == color ->
        IO.inspect("przeniesienie w lego")
        User.write_and_make_move(cube,old_m, "FLD'L'D")

      Enum.at(Map.get(cube, :horizontal_middle_side), 10) == color ->
        IO.inspect("przeniesienie do tylu")
        User.write_and_make_move(cube,old_m, "FDLD'D'L'D")
    end
  end

  def move_for_h_middle(cube, index, color, side_looking,old_m)
      when index > 5 and side_looking == :right do
    IO.inspect("przesuniecie kostki w prawo Y prime")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y'")
    move_for_h_middle(cube, index - 3, color, side_looking,moves)
  end

  def move_for_h_middle(cube, index, color, side_looking,old_m)
      when index < 5 and side_looking == :right do
    IO.inspect("przesuniecie kostki w lewo Y")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y")
    move_for_h_middle(cube, index + 3, color, side_looking,moves)
  end

  def move_for_h_middle(cube, index, color, side_looking,old_m)
      when index > 3 and side_looking == :left do
    IO.inspect("przesuniecie kostki w prawo Y prime")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y'")
    move_for_h_middle(cube, index - 3, color, side_looking,moves)
  end

  def move_for_h_middle(cube, index, color, side_looking,old_m)
      when index < 3 and side_looking == :left do
    IO.inspect("przesuniecie kostki w lewo Y")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y")
    move_for_h_middle(cube, index + 3, color, side_looking,moves)
  end

  def move_for_h_middle(cube, index, color, side_looking,old_m)
      when side_looking == :left and index == 3 do
        IO.inspect(color)
    {cube,new_moves} =
      cond do
        Enum.at(Map.get(cube, :horizontal_middle_side), 4) == color ->
          IO.inspect("przeniesienie na przod (patrzy w lewo) ")
          User.write_and_make_move(cube,old_m, "DR'D'")

        Enum.at(Map.get(cube, :horizontal_middle_side), 1) == color ->
          IO.inspect("przeniesienie na prawo")
          User.write_and_make_move(cube,old_m, "R'")

        Enum.at(Map.get(cube, :horizontal_middle_side), 7) == color ->
          IO.inspect("przeniesienie w lego")
          User.write_and_make_move(cube,old_m, "RUR'ULL")

        Enum.at(Map.get(cube, :horizontal_middle_side), 10) == color ->
          IO.inspect("przeniesienie do tylu")
          User.write_and_make_move(cube,old_m, "RU'R'BB")
      end
  end

  def move_for_h_middle(cube, index, color, side_looking,old_m)
      when side_looking == :right and index == 5 do
    IO.inspect(color)
    cond do
      Enum.at(Map.get(cube, :horizontal_middle_side), 4) == color ->
        IO.inspect("obrot ")
        User.write_and_make_move(cube,old_m, "D'LD")

      Enum.at(Map.get(cube, :horizontal_middle_side), 1) == color ->
        IO.inspect("przeniesienie na prawo")
        User.write_and_make_move(cube,old_m, "L'U'LU'RR")

      Enum.at(Map.get(cube, :horizontal_middle_side), 7) == color ->
        IO.inspect("przeniesienie w lego")
        User.write_and_make_move(cube,old_m, "L")

      Enum.at(Map.get(cube, :horizontal_middle_side), 10) == color ->
        IO.inspect("przeniesienie do tylu")
        User.write_and_make_move(cube,old_m, "L'ULBB")
    end
  end

  def move_for_h_up(cube, index, color, side_looking,old_m) when index > 4 do
    IO.inspect("przesuniecie kostki w prawo Y prime")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y'")
    move_for_h_up(cube, index - 3, color, side_looking,moves)
  end

  def move_for_h_up(cube, index, color, side_looking,old_m) when index < 4 do
    IO.inspect("przesuniecie kostki w lewo Y")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y")
    move_for_h_up(cube, index + 3, color, side_looking,moves)
  end

  def move_for_h_up(cube, index, color, side_looking,old_m) when side_looking == :ver and index == 4 do
    IO.inspect(color)
    cond do
      Enum.at(Map.get(cube, :horizontal_middle_side), 4) == color ->
        IO.inspect("obrot ")
        User.write_and_make_move(cube,old_m, "U'R'FR")

      Enum.at(Map.get(cube, :horizontal_middle_side), 1) == color ->
        IO.inspect("przeniesienie na prawo")
        User.write_and_make_move(cube,old_m, "FR'F'")

      Enum.at(Map.get(cube, :horizontal_middle_side), 7) == color ->
        IO.inspect("przeniesienie w lego")
        User.write_and_make_move(cube,old_m, "F'LF")

      Enum.at(Map.get(cube, :horizontal_middle_side), 10) == color ->
        IO.inspect("przeniesienie do tylu")
        User.write_and_make_move(cube,old_m, "U'RB'R'")
    end
  end

  def move_for_h_up(cube, index, color, side_looking,old_m) when side_looking == :up and index == 4 do
    IO.inspect(color)
    cond do
      Enum.at(Map.get(cube, :horizontal_middle_side), 4) == color ->
        IO.inspect("obrot ")
        User.write_and_make_move(cube,old_m, "FF")

      Enum.at(Map.get(cube, :horizontal_middle_side), 1) == color ->
        IO.inspect("przeniesienie na prawo")
        User.write_and_make_move(cube,old_m, "URR")

      Enum.at(Map.get(cube, :horizontal_middle_side), 7) == color ->
        IO.inspect("przeniesienie w lego")
        User.write_and_make_move(cube,old_m,"U'LL")

      Enum.at(Map.get(cube, :horizontal_middle_side), 10) == color ->
        IO.inspect("przeniesienie do tylu")
        User.write_and_make_move(cube, old_m,"UUBB")
    end
  end
end
