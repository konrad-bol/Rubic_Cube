defmodule Rubic do
defstruct [
  vertical_right_side: [:white,:white,:white,:blue,:blue,:blue,:yellow,:yellow,:yellow,:green,:green,:green],
  vertical_middle_side: [:white,:white,:white,:blue,:blue,:blue,:yellow,:yellow,:yellow,:green,:green,:green],
  vertical_left_side: [:white,:white,:white,:blue,:blue,:blue,:yellow,:yellow,:yellow,:green,:green,:green],
  front_face_side: [:white,:white,:white,:orange,:orange,:orange,:yellow,:yellow,:yellow,:red,:red,:red],
  front_middle_side: [:white,:white,:white,:orange,:orange,:orange,:yellow,:yellow,:yellow,:red,:red,:red],
  front_back_side: [:white,:white,:white,:orange,:orange,:orange,:yellow,:yellow,:yellow,:red,:red,:red],
  horizontal_up_side: [:red,:red,:red,:blue,:blue,:blue,:orange,:orange,:orange,:green,:green,:green],
  horizontal_midle_side: [:red,:red,:red,:blue,:blue,:blue,:orange,:orange,:orange,:green,:green,:green],
  horizontal_down_side: [:red,:red,:red,:blue,:blue,:blue,:orange,:orange,:orange,:green,:green,:green]
]
  def show_struct() do
    %Rubic{}
  end
end
