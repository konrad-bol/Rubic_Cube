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
  def get_list_of_side(_cube,:vertical) do
   [:front_back_side, :front_middle_side, :front_face_side,
   :horizontal_down_side, :horizontal_middle_side,:horizontal_up_side,
   :front_face_side, :front_middle_side, :front_back_side,
   :horizontal_up_side ,:horizontal_middle_side ,:horizontal_down_side]
  end
  def get_color2(cube,num,outdata) do
    index= case outdata  do
      :front-> modify_index( [0,8,6,7,8],num)
      :horizontal -> modify_index([9,9,9,5,5,5,5,5,5,9,9,9],num)
      :vertical ->modify_index2([0,0,0,3,3,3,8,8,8,11,11,11],num)
   end
  end
  def get_color(cube,num,outdata_side) do
    index= case outdata_side  do
       :front-> modify_index( [0,0,0,8,8,8,8,8,8,0,0,0],num)
       :horizontal -> modify_index([9,9,9,5,5,5,5,5,5,9,9,9],num)
       :vertical ->modify_index2([0,0,0,3,3,3,8,8,8,11,11,11],num)
    end

    side = get_list_of_side(cube,outdata_side)
    Enum.zip_with(side,index, fn side, id ->
      Map.get(cube,side)
      |> Enum.at(id)
    end)
  end
  #def swap(list,num1,num2) do

  #end
  def modify_index(list, num)do
    list
    |> Enum.with_index()
    |> Enum.map(fn {value, index} ->
      cond do
        index < 3 -> value + num
        index < 9 -> value - num
        true -> value + num
      end
    end)
  end
  def modify_index2(list, num)do
    list
    |> Enum.with_index()
    |> Enum.map(fn {value, index} ->
      cond do
        index < 6 -> value + num
        true -> value - num
      end
    end)
  end
end
