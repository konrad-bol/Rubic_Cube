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
end
