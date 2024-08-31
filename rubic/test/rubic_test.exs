defmodule RubicTest do
  use ExUnit.Case
  doctest Rubic

  test "R move" do
    cube = %Rubic{}
    |> Rubic.Fun.right()
    |> Map.from_struct()
    assert cube == %{
    vertical_right_side:    [:green,:green,:green,:white,:white,:white,:blue,:blue,:blue,:yellow,:yellow,:yellow],
    vertical_middle_side:   [:white,:white,:white,:blue,:blue,:blue,:yellow,:yellow,:yellow,:green,:green,:green],
    vertical_left_side:     [:white,:white,:white,:blue,:blue,:blue,:yellow,:yellow,:yellow,:green,:green,:green],
    front_face_side:        [:green,:white,:white,:orange,:orange,:orange,:yellow,:yellow,:blue,:red,:red,:red],
    front_middle_side:      [:green,:white,:white,:orange,:orange,:orange,:yellow,:yellow,:blue,:red,:red,:red],
    front_back_side:        [:green,:white,:white,:orange,:orange,:orange,:yellow,:yellow,:blue,:red,:red,:red],
    horizontal_up_side:     [:red,:red,:red,:white,:blue,:blue,:orange,:orange,:orange,:green,:green,:yellow],
    horizontal_middle_side: [:red,:red,:red,:white,:blue,:blue,:orange,:orange,:orange,:green,:green,:yellow],
    horizontal_down_side:   [:red,:red,:red,:white,:blue,:blue,:orange,:orange,:orange,:green,:green,:yellow],

  }
  end
  test "D move" do
    cube = %Rubic{}
    |> Rubic.Fun.down()
    |> Map.from_struct()
    assert cube == %{
    vertical_right_side:    [:white,:white,:white,:orange,:blue,:blue,:yellow,:yellow,:yellow,:green,:green,:red],
    vertical_middle_side:   [:white,:white,:white,:orange,:blue,:blue,:yellow,:yellow,:yellow,:green,:green,:red],
    vertical_left_side:     [:white,:white,:white,:orange,:blue,:blue,:yellow,:yellow,:yellow,:green,:green,:red],
    front_face_side:        [:white,:white,:white,:green,:orange,:orange,:yellow,:yellow,:yellow,:red,:red,:blue],
    front_middle_side:      [:white,:white,:white,:green,:orange,:orange,:yellow,:yellow,:yellow,:red,:red,:blue],
    front_back_side:        [:white,:white,:white,:green,:orange,:orange,:yellow,:yellow,:yellow,:red,:red,:blue],
    horizontal_up_side:     [:red,:red,:red,:blue,:blue,:blue,:orange,:orange,:orange,:green,:green,:green],
    horizontal_middle_side: [:red,:red,:red,:blue,:blue,:blue,:orange,:orange,:orange,:green,:green,:green],
    horizontal_down_side:   [:blue,:blue,:blue,:orange,:orange,:orange,:green,:green,:green,:red,:red,:red],

  }
  end
  test "U move" do
    cube = %Rubic{}
    |> Rubic.Fun.up()
    |> Map.from_struct()
    assert cube == %{
      vertical_right_side:    [:white,:white,:white,:blue,:blue,:red,:yellow,:yellow,:yellow,:orange,:green,:green],
      vertical_middle_side:   [:white,:white,:white,:blue,:blue,:red,:yellow,:yellow,:yellow,:orange,:green,:green],
      vertical_left_side:     [:white,:white,:white,:blue,:blue,:red,:yellow,:yellow,:yellow,:orange,:green,:green],
      front_face_side:        [:white,:white,:white,:orange,:orange,:blue,:yellow,:yellow,:yellow,:green,:red,:red],
      front_middle_side:      [:white,:white,:white,:orange,:orange,:blue,:yellow,:yellow,:yellow,:green,:red,:red],
      front_back_side:        [:white,:white,:white,:orange,:orange,:blue,:yellow,:yellow,:yellow,:green,:red,:red],
      horizontal_up_side:     [:green,:green,:green,:red,:red,:red,:blue,:blue,:blue,:orange,:orange,:orange,],
      horizontal_middle_side: [:red,:red,:red,:blue,:blue,:blue,:orange,:orange,:orange,:green,:green,:green],
      horizontal_down_side:   [:red,:red,:red,:blue,:blue,:blue,:orange,:orange,:orange,:green,:green,:green],

  }
  end
  test "L move" do
    cube = %Rubic{}
    |> Rubic.Fun.left()
    |> Map.from_struct()
    assert cube == %{
      vertical_right_side:    [:white,:white,:white,:blue,:blue,:blue,:yellow,:yellow,:yellow,:green,:green,:green],
      vertical_middle_side:   [:white,:white,:white,:blue,:blue,:blue,:yellow,:yellow,:yellow,:green,:green,:green],
      vertical_left_side:     [:blue,:blue,:blue,:yellow,:yellow,:yellow,:green,:green,:green,:white,:white,:white],
      front_face_side:        [:white,:white,:blue,:orange,:orange,:orange,:green,:yellow,:yellow,:red,:red,:red],
      front_middle_side:      [:white,:white,:blue,:orange,:orange,:orange,:green,:yellow,:yellow,:red,:red,:red],
      front_back_side:        [:white,:white,:blue,:orange,:orange,:orange,:green,:yellow,:yellow,:red,:red,:red],
      horizontal_up_side:     [:red,:red,:red,:blue,:blue,:yellow,:orange,:orange,:orange,:white,:green,:green],
      horizontal_middle_side: [:red,:red,:red,:blue,:blue,:yellow,:orange,:orange,:orange,:white,:green,:green],
      horizontal_down_side:   [:red,:red,:red,:blue,:blue,:yellow,:orange,:orange,:orange,:white,:green,:green],

  }
  end
  test "F move" do
    cube = %Rubic{}
    |> Rubic.Fun.front()
    |> Map.from_struct()
    assert cube == %{
      vertical_right_side:    [:white,:white,:red,:blue,:blue,:blue,:orange,:yellow,:yellow,:green,:green,:green],
      vertical_middle_side:   [:white,:white,:red,:blue,:blue,:blue,:orange,:yellow,:yellow,:green,:green,:green],
      vertical_left_side:     [:white,:white,:red,:blue,:blue,:blue,:orange,:yellow,:yellow,:green,:green,:green],
      front_face_side:        [:red,:red,:red,:white,:white,:white,:orange,:orange,:orange,:yellow,:yellow,:yellow],
      front_middle_side:      [:white,:white,:white,:orange,:orange,:orange,:yellow,:yellow,:yellow,:red,:red,:red],
      front_back_side:        [:white,:white,:white,:orange,:orange,:orange,:yellow,:yellow,:yellow,:red,:red,:red],
      horizontal_up_side:     [:red,:red,:yellow,:blue,:blue,:blue,:white,:orange,:orange,:green,:green,:green],
      horizontal_middle_side: [:red,:red,:yellow,:blue,:blue,:blue,:white,:orange,:orange,:green,:green,:green],
      horizontal_down_side:   [:red,:red,:yellow,:blue,:blue,:blue,:white,:orange,:orange,:green,:green,:green],

  }
  end
  test "B move" do
    cube = %Rubic{}
    |> Rubic.Fun.back()
    |> Map.from_struct()
    assert cube == %{
      vertical_right_side:    [:orange,:white,:white,:blue,:blue,:blue,:yellow,:yellow,:red,:green,:green,:green],
      vertical_middle_side:   [:orange,:white,:white,:blue,:blue,:blue,:yellow,:yellow,:red,:green,:green,:green],
      vertical_left_side:     [:orange,:white,:white,:blue,:blue,:blue,:yellow,:yellow,:red,:green,:green,:green],
      front_face_side:        [:white,:white,:white,:orange,:orange,:orange,:yellow,:yellow,:yellow,:red,:red,:red],
      front_middle_side:      [:white,:white,:white,:orange,:orange,:orange,:yellow,:yellow,:yellow,:red,:red,:red],
      front_back_side:        [:orange,:orange,:orange,:yellow,:yellow,:yellow,:red,:red,:red,:white,:white,:white],
      horizontal_up_side:     [:white,:red,:red,:blue,:blue,:blue,:orange,:orange,:yellow,:green,:green,:green],
      horizontal_middle_side: [:white,:red,:red,:blue,:blue,:blue,:orange,:orange,:yellow,:green,:green,:green],
      horizontal_down_side:   [:white,:red,:red,:blue,:blue,:blue,:orange,:orange,:yellow,:green,:green,:green],

  }
  end
end
