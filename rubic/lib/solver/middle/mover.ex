defmodule Solver.Middle.Mover do
  alias Rubic.User

  def move_edge(cube, [color_1, color_2], index,old_m) when index > 5 do
    IO.inspect("przeniesienie w prwao Y prime")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y'")
    move_edge(cube, [color_1, color_2], index - 3,moves)
  end

  def move_edge(cube, [color_1, color_2], index,old_m) when index < 3 do
    IO.inspect("przeniesienie w lewo Y")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y")
    move_edge(cube, [color_1, color_2], index + 3,moves)
  end

  def move_edge(cube, edge = [color_ver, color_up], index,old_m) when index == 4 do
    h_m =
      Map.get(cube, :horizontal_middle_side)
      |> Enum.with_index()
      |> Enum.filter(fn {_, index} -> rem(index, 3) == 1 end)
      |> Enum.map(fn {color, _} -> color end)
      |>IO.inspect()
    case Enum.find_index(h_m, fn color -> color == color_ver end) do
      0 -> IO.inspect("na prawo powinno byc")
      {cube,moves}=User.write_and_make_move(cube,old_m,"U'Y")
      permutation_edge(cube,edge,index,moves)

      1 -> IO.inspect("jest poprawnie")
      #{cube,moves}=User.write_and_make_move(cube,old_m,"")
      permutation_edge(cube,edge,index,old_m)

      2->  IO.inspect("na lewo")
      {cube,moves}=User.write_and_make_move(cube,old_m,"UY'")
      permutation_edge(cube,edge,index,moves)

      3-> IO.inspect("do tylu")
      {cube,moves}=User.write_and_make_move(cube,old_m,"UUYY")
      permutation_edge(cube,edge,index,moves)
    end
  end
  def move_edge_mid(cube, [color_1, color_2], index,old_m) when index > 3 do
    IO.inspect("przeniesienie w prwao Y prime")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y'")
    move_edge_mid(cube, [color_1, color_2], index - 3,moves)
  end

  def move_edge_mid(cube, [color_1, color_2], index,old_m) when index < 3 do
    IO.inspect("przeniesienie w lewo Y")
    {cube,moves}=User.write_and_make_move(cube,old_m,"Y")
    move_edge_mid(cube, [color_1, color_2], index + 3,moves)
  end
  def move_edge_mid(cube, edge = [color_up, color_ver], index,old_m) when index == 3 do
    #cube=User.multiple_move(cube,"URU'R'FR'F'RUU")
    {cube,old_m}=User.write_and_make_move(cube,old_m,"URU'R'FR'F'RUU")
    h_m =
      Map.get(cube, :horizontal_middle_side)
      |> Enum.with_index()
      |> Enum.filter(fn {_, index} -> rem(index, 3) == 1 end)
      |> Enum.map(fn {color, _} -> color end)
      |>IO.inspect()
      IO.inspect(edge)
    case Enum.find_index(h_m, fn color -> color == color_ver end) do
      0 -> IO.inspect("na prawo powinno byc")
      {cube,moves}=User.write_and_make_move(cube,old_m,"U'Y")
      permutation_edge(cube,[color_ver, color_up],index,moves)

      1 -> IO.inspect("jest poprawnie")
      permutation_edge(cube,[color_ver, color_up],index,old_m)

      2->  IO.inspect("na lewo")
      {cube,moves}=User.write_and_make_move(cube,old_m,"UY'")
      permutation_edge(cube,[color_ver, color_up],index,moves)

      3-> IO.inspect("do tylu")
      {cube,moves}=User.write_and_make_move(cube,old_m,"UUYY")
      permutation_edge(cube,[color_ver, color_up],index,moves)
    end
  end

  def permutation_edge(cube, edge = [color_ver, color_up], index,old_m) do
    h_m = Map.get(cube, :horizontal_middle_side)
    IO.inspect(edge)
    IO.inspect([Enum.at(h_m, 4), Enum.at(h_m, 1)])
    IO.inspect([Enum.at(h_m, 4), Enum.at(h_m, 7)])
    cond do
      edge == [Enum.at(h_m, 4), Enum.at(h_m, 1)] ->
        IO.inspect("przeniesienie na prawo")
        {cube,moves}=User.write_and_make_move(cube,old_m,"URU'R'FR'F'R")
        #User.multiple_move(cube,"URU'R'FR'F'R")

      edge == [Enum.at(h_m, 4), Enum.at(h_m, 7)] ->
        IO.inspect("przeniesienie na lewo")
        {cube,moves}=User.write_and_make_move(cube,old_m,"U'L'ULF'LFL'")
        #User.multiple_move(cube,"U'L'ULF'LFL'")
    end
  end
end
