defmodule Rubic do
defstruct [
  vertical_right_side:    [:white,:white,:white,:blue,:blue,:blue,:yellow,:yellow,:yellow,:green,:green,:green],
  vertical_middle_side:   [:white,:white,:white,:blue,:blue,:blue,:yellow,:yellow,:yellow,:green,:green,:green],
  vertical_left_side:     [:white,:white,:white,:blue,:blue,:blue,:yellow,:yellow,:yellow,:green,:green,:green],
  front_face_side:        [:white,:white,:white,:orange,:orange,:orange,:yellow,:yellow,:yellow,:red,:red,:red],
  front_middle_side:      [:white,:white,:white,:orange,:orange,:orange,:yellow,:yellow,:yellow,:red,:red,:red],
  front_back_side:        [:white,:white,:white,:orange,:orange,:orange,:yellow,:yellow,:yellow,:red,:red,:red],
  horizontal_up_side:     [:red,:red,:red,:blue,:blue,:blue,:orange,:orange,:orange,:green,:green,:green],
  horizontal_middle_side: [:red,:red,:red,:blue,:blue,:blue,:orange,:orange,:orange,:green,:green,:green],
  horizontal_down_side:   [:red,:red,:red,:blue,:blue,:blue,:orange,:orange,:orange,:green,:green,:green],


]

  def tally(cube) do
   [
      vrs: cube.vertical_right_side,
      vms: cube.vertical_middle_side,
      vls: cube.vertical_left_side,

      ffs: cube.front_face_side,
      fms: cube.front_middle_side,
      fbs: cube.front_back_side,

      hus: cube.horizontal_up_side,
      hms: cube.horizontal_middle_side,
      hds: cube.horizontal_down_side,
  ]
  end
end
