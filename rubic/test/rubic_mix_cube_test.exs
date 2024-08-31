defmodule RubicMixCubeTest do
  use ExUnit.Case
  doctest Rubic
  test "simple mix cube" do
    cube = %Rubic{}
    |> Rubic.Fun.right()
    |> Rubic.Fun.up()

    |> Map.from_struct()
    assert cube == %{
    vertical_right_side:    [:green,:green,:green,    :white,:white,:red,      :blue,:yellow,:yellow,      :orange,:yellow,:yellow],
    vertical_middle_side:   [:white,:white,:white,      :blue,:blue,:red,      :blue,:yellow,:yellow,      :orange,:green,:green],
    vertical_left_side:     [:white,:white,:white,     :blue,:blue,:red,      :blue,:yellow,:yellow,        :orange,:green,:green],
    front_face_side:        [:green,:white,:white,     :orange,:orange,:white,    :blue,:blue,:blue,         :yellow,:red,:red],
    front_middle_side:      [:green,:white,:white,   :orange,:orange,:blue,     :yellow,:yellow,:yellow,       :green,:red,:red],
    front_back_side:        [:green,:white,:white,  :orange,:orange,:blue,       :yellow,:yellow,:yellow,        :green,:red,:red],
    horizontal_up_side:     [:green,:green,:yellow,    :red,:red,:red,       :white,:blue,:blue,         :orange,:orange,:orange],
    horizontal_middle_side: [:red,:red,:red,          :white,:blue,:blue,      :orange,:orange,:orange,       :green,:green,:yellow],
    horizontal_down_side:   [:red,:red,:red,        :white,:blue,:blue,     :orange,:orange,:orange,      :green,:green,:yellow],

  }
  end
  test "complex mix cube" do
    cube = %Rubic{}
    |> Rubic.Fun.right()
    |> Rubic.Fun.up()
    |> Rubic.Fun.left()
    |> Rubic.Fun.down()
    |> Rubic.Fun.front()
    |> Rubic.Fun.back()
    |> Rubic.Fun.up()

    |> Map.from_struct()
    assert cube == %{
    vertical_right_side:    [:yellow,:white,:yellow,    :red,:red,:green,      :white,:red,:green,      :yellow,:red,:red],
    vertical_middle_side:   [:orange,:white,:red,      :white,:blue,:green,      :yellow,:yellow,:green,      :orange,:green,:white],
    vertical_left_side:     [:orange,:white,:blue,     :white,:orange,:orange,      :blue,:blue,:white,        :blue,:orange,:white],

    front_face_side:        [:yellow,:red,:blue,     :red,:blue,:yellow,    :blue,:yellow,:white,         :red,:blue,:blue],
    front_middle_side:      [:white,:white,:white,   :green,:orange,:yellow,     :blue,:yellow,:red,       :yellow,:red,:blue],
    front_back_side:        [:yellow,:orange,:orange,  :green,:yellow,:orange,       :white,:green,:green,        :orange,:green,:green],

    horizontal_up_side:     [:orange,:yellow,:red,    :green,:green,:orange,       :yellow,:yellow,:orange,         :blue,:orange,:yellow],
    horizontal_middle_side: [:green,:red,:blue,          :red,:blue,:orange,      :blue,:orange,:yellow,       :orange,:green,:red],
    horizontal_down_side:   [:green,:blue,:blue,        :red,:white,:white,     :red,:green,:green,      :white,:white,:red],

  }
  end
end
