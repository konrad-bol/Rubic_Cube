defmodule Rubic.Construct do
  alias Rubic.Helper
  @dictionary%{
    red_face: :vertical,
    orange_face: :vertical,

    blue_face: :front,
    green_face: :front,

    yellow_face: :horizontal,
    white_face: :horizontal,
  }


  def construct(cube,new_side) do
    cube = [:front,:horizontal,:vertical]
    |> Enum.filter(&(&1 != @dictionary[new_side]))
    |> Enum.reduce(cube, fn x,acc ->
      acc = update_one_side(x,acc)
      IO.inspect(acc)
    end)
    |> update_from_face(new_side)
  end
  def update_from_face(cube,new_face) do

  end
  def update_one_side(:front,cube) do
    IO.puts(("uptade front"))
    cube
    |>Map.put(:front_face_side,Helper.get_color(cube,2,:front))
    |>Map.put(:front_middle_side,Helper.get_color(cube,1,:front))
    |>Map.put(:front_back_side,Helper.get_color(cube,0,:front))
  end

  def update_one_side(:horizontal,cube)  do
    IO.puts(("uptade hori"))
    cube
    |>Map.put(:horizontal_up_side,Helper.get_color(cube,0,:horizontal))
    |>Map.put(:horizontal_middle_side,Helper.get_color(cube,1,:horizontal))
    |>Map.put(:horizontal_down_side,Helper.get_color(cube,2,:horizontal))
  end

  def update_one_side(:vertical,cube)  do
    IO.puts(("uptade  vert"))
    cube
    |>Map.put(:vertical_right_side,Helper.get_color(cube,0,:vertical))
    |>Map.put(:vertical_middle_side,Helper.get_color(cube,1,:vertical))
    |>Map.put(:vertical_left_side,Helper.get_color(cube,2,:vertical))
  end

  def update_from_wall(cube) do

  end
end
