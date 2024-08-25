defmodule Rubic.Helper do


  def get_list_of_side(_cube,:front) do
    [:vertical_right_side, :vertical_middle_side, :vertical_left_side,
     :horizontal_down_side, :horizontal_middle_side, :horizontal_up_side,
     :vertical_left_side, :vertical_middle_side, :vertical_right_side,
     :horizontal_up_side, :horizontal_middle_side, :horizontal_down_side]
  end
  def get_list_of_side(_cube,:horizontal) do
    [ :front_back_side, :front_middle_side, :front_face_side,
      :vertical_right_side,:vertical_middle_side,:vertical_left_side,
      :front_face_side, :front_middle_side, :front_back_side,
      :vertical_left_side,:vertical_middle_side, :vertical_right_side]
  end

  def rotate_side(cube,side,clockwise?) when clockwise? == true  do
    Map.get_and_update(cube,side, fn s ->
      new_side =
      s
      |> Stream.cycle()
      |> Stream.drop(9)
      |> Enum.take(12)
      {s,new_side}
    end)
    |>elem(1)
  end



end
