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
  test "prime L move" do
    cube = %Rubic{}
    |> Rubic.Fun.left()
    |> Rubic.Fun.left()
    |> Rubic.Fun.left()
    assert cube == Rubic.Fun.left_prime(%Rubic{})
  end
  test "prime R move" do
    cube = %Rubic{}
    |> Rubic.Fun.right()
    |> Rubic.Fun.right()
    |> Rubic.Fun.right()
    assert cube == Rubic.Fun.right_prime(%Rubic{})
  end
  test "prime U move" do
    cube = %Rubic{}
    |> Rubic.Fun.up()
    |> Rubic.Fun.up()
    |> Rubic.Fun.up()
    assert cube == Rubic.Fun.up_prime(%Rubic{})
  end
  test "prime D move" do
    cube = %Rubic{}
    |> Rubic.Fun.down()
    |> Rubic.Fun.down()
    |> Rubic.Fun.down()
    assert cube == Rubic.Fun.down_prime(%Rubic{})
  end
  test "prime F move" do
    cube = %Rubic{}
    |> Rubic.Fun.front()
    |> Rubic.Fun.front()
    |> Rubic.Fun.front()
    assert cube == Rubic.Fun.front_prime(%Rubic{})
  end
  test "prime B move" do
    cube = %Rubic{}
    |> Rubic.Fun.back()
    |> Rubic.Fun.back()
    |> Rubic.Fun.back()
    assert cube == Rubic.Fun.back_prime(%Rubic{})
  end
  test "prime E move" do
    cube = %Rubic{}
    |> Rubic.Fun.e_move()
    |> Rubic.Fun.e_move()
    |> Rubic.Fun.e_move()
    assert cube == Rubic.Fun.e_move_prime(%Rubic{})
  end
  test "prime M move" do
    cube = %Rubic{}
    |> Rubic.Fun.m_move()
    |> Rubic.Fun.m_move()
    |> Rubic.Fun.m_move()
    assert cube == Rubic.Fun.m_move_prime(%Rubic{})
  end
  test "prime S move" do
    cube = %Rubic{}
    |> Rubic.Fun.s_move()
    |> Rubic.Fun.s_move()
    |> Rubic.Fun.s_move()
    assert cube == Rubic.Fun.s_move_prime(%Rubic{})
  end
end
