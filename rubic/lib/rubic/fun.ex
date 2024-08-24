defmodule Rubic.Fun do
  alias Rubic
  alias Rubic.Construct
  alias Rubic.Helper
  def right(cube) do
    face = Map.get(cube,:red_face)
    |> Stream.cycle()
    |> Stream.drop(6)
    |> Enum.take(8)
    Map.put(cube,:red_face,face)
    side = Map.get(cube,:vertical_right_side)
    |> Stream.cycle()
    |> Stream.drop(9)
    |> Enum.take(12)
    Map.put(cube,:vertical_right_side,side)
    |> Construct.construct(:red)
  end

  def left(cube) do
    side = Map.get(cube,:vertical_left_side)
    |> Stream.cycle()
    |> Stream.drop(9)
    |> Enum.take(12)
    Map.put(cube,:vertical_left_side,side)
    |> Construct.construct(:vertical)
  end
  def up(cube) do
    side = Map.get(cube,:horizontal_up_side)
    |> Stream.cycle()
    |> Stream.drop(9)
    |> Enum.take(12)
    Map.put(cube,:horizontal_up_side,side)
    copy_V_r= Map.get(cube,:vertical_right_side)
    copy_V_m= Map.get(cube,:vertical_middle_side)
    copy_V_l= Map.get(cube,:vertical_left_side)


  end


end
