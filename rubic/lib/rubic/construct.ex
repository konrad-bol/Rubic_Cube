defmodule Rubic.Construct do
  require Math
  def calculate_position(r_circle,r_dot) do
    list=[125.0,150.0,175.0]
    #|>Enum.map( &(calcul_helper(r_circle,201,&1)))
    deg_pos= Enum.map(list,&(52.293-calcul_helper(r_circle,164.32,&1))) ++ Enum.map(list, &(calcul_helper(r_circle,201,&1)))++ Enum.map(list,&(52.293+calcul_helper(r_circle,164.32,&1)))++Enum.map(list,&(calcul_helper(r_circle,201,&1)*-1))
    convert_positon(deg_pos,r_circle,r_dot)
  end
  def calcul_helper(a,b,c) do
    Math.acos(((Math.pow(a,2)+Math.pow(b,2)-Math.pow(c,2))/(2*a*b)))
    |> Math.rad2deg()
  end
  def convert_positon(list,r_circle,r_dot) do
    list
    |> Enum.map(&("transform: rotate("<>Float.to_string(&1)<>"deg) "<>"translate("<>Integer.to_string(r_circle-r_dot)<>"px);"))
  end
  def get_color_list(cube,side) do
    Map.get(cube,side)
    |> Enum.map(&("background-color: "<>Atom.to_string(&1)<>";"))
  end
  def combine_position(cube,side,r,r_d) do
    Enum.zip_with(get_color_list(cube,side), calculate_position(r,r_d), &(&1<>" "<>&2))
  end
end
