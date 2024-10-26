defmodule Solver.Solver do
  def solve_cube(cube) do
    {cube,moves}=
      cube
    |> Solver.Cross.Searcher.make_cross()
    |> Solver.Corner.Searcher.make_corner()
    |> Solver.Middle.Searcher.make_2l()
    |> Solver.UperCross.Cross.make_upercross()

    |> Solver.UperCorner.Corner.make_corner()

  end
end
