defmodule Rubic.Fun do

  def right(cube) do
    side = Map.get(cube,:vertical_right_side)
    |> Stream.cycle()
    |> Stream.drop(9)
    |> Enum.take(12)
    Map.put(cube,:vertical_right_side,side)
    |> construct(:front)
  end
  def left(cube) do
    side = Map.get(cube,:vertical_left_side)
    |> Stream.cycle()
    |> Stream.drop(9)
    |> Enum.take(12)
    Map.put(cube,:vertical_left_side,side)
    |> construct(:front)
  end

  def update_state(:vertical) do
    #cube = %Rubic{}
    #front_side_1 =
  end

  def construct(cube,:front) do
    Map.put(cube,:front_face_side,get_color(cube,0))
    |>Map.put(:front_middle_side,get_color(cube,1))
    |>Map.put(:front_back_side,get_color(cube,2))
  end
  def get_color(cube,num) do
    index= [0,0,0,8,8,8,8,8,8,0,0,0]
    |> Enum.map(&(&1+num))
    side = Map.keys(cube)
    |> Enum.drop(1)
    |> Enum.slide(3..5,0)
    |> Enum.drop(3)
    |> List.duplicate(2)
    |> List.flatten()
    |> Enum.reverse_slice(3,3)
    |> Enum.reverse_slice(6,3)

    Enum.zip_with(side,index, fn side, id ->
      Map.get(cube,side)
      |> Enum.at(id)
    end)
  end
end
