defmodule Solver.Middle.Mover do
  alias Rubic.User

  def move_edge(cube, [color_1, color_2], index) when index > 5 do
    IO.inspect("przeniesienie w prwao Y prime")
    move_edge(Rubic.Fun.y_move_prime(cube), [color_1, color_2], index - 3)
  end

  def move_edge(cube, [color_1, color_2], index) when index < 3 do
    IO.inspect("przeniesienie w lewo Y")
    move_edge(Rubic.Fun.y_move(cube), [color_1, color_2], index + 3)
  end

  def move_edge(cube, edge = [color_ver, color_up], index) when index == 4 do
    h_m =
      Map.get(cube, :horizontal_middle_side)
      |> Enum.with_index()
      |> Enum.filter(fn {_, index} -> rem(index, 3) == 1 end)
      |> Enum.map(fn {color, _} -> color end)
      |>IO.inspect()
    case Enum.find_index(h_m, fn color -> color == color_ver end) do
      0 -> IO.inspect("na prawo powinno byc")
      permutation_edge(User.multiple_move(cube,"U'Y"),edge,index)
      1 -> IO.inspect("jest poprawnie")
      permutation_edge(cube,edge,index)
      2->  IO.inspect("na lewo")
      permutation_edge(User.multiple_move(cube,"UY'"),edge,index)
      3-> IO.inspect("do tylu")
      permutation_edge(User.multiple_move(cube,"UUYY"),edge,index)
    end
  end
  def move_edge_mid(cube, [color_1, color_2], index) when index > 3 do
    IO.inspect("przeniesienie w prwao Y prime")
    move_edge_mid(Rubic.Fun.y_move_prime(cube), [color_1, color_2], index - 3)
  end

  def move_edge_mid(cube, [color_1, color_2], index) when index < 3 do
    IO.inspect("przeniesienie w lewo Y")
    move_edge_mid(Rubic.Fun.y_move(cube), [color_1, color_2], index + 3)
  end
  def move_edge_mid(cube, edge = [color_up, color_ver], index) when index == 3 do
    cube=User.multiple_move(cube,"URU'R'FR'F'RUU")
    h_m =
      Map.get(cube, :horizontal_middle_side)
      |> Enum.with_index()
      |> Enum.filter(fn {_, index} -> rem(index, 3) == 1 end)
      |> Enum.map(fn {color, _} -> color end)
      |>IO.inspect()
      IO.inspect(edge)
    case Enum.find_index(h_m, fn color -> color == color_ver end) do
      0 -> IO.inspect("na prawo powinno byc")
      permutation_edge(User.multiple_move(cube,"U'Y"),[color_ver, color_up],index)
      1 -> IO.inspect("jest poprawnie")
      permutation_edge(cube,[color_ver, color_up],index)
      2->  IO.inspect("na lewo")
      permutation_edge(User.multiple_move(cube,"UY'"),[color_ver, color_up],index)
      3-> IO.inspect("do tylu")
      permutation_edge(User.multiple_move(cube,"UUYY"),[color_ver, color_up],index)
    end
  end

  def permutation_edge(cube, edge = [color_ver, color_up], index) do
    h_m = Map.get(cube, :horizontal_middle_side)
    IO.inspect(edge)
    IO.inspect([Enum.at(h_m, 4), Enum.at(h_m, 1)])
    IO.inspect([Enum.at(h_m, 4), Enum.at(h_m, 7)])
    cond do
      edge == [Enum.at(h_m, 4), Enum.at(h_m, 1)] ->
        IO.inspect("przeniesienie na prawo")
        User.multiple_move(cube,"URU'R'FR'F'R")

      edge == [Enum.at(h_m, 4), Enum.at(h_m, 7)] ->
        IO.inspect("przeniesienie na lewo")
        User.multiple_move(cube,"U'L'ULF'LFL'")
    end
  end
end
