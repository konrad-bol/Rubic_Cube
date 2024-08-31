defmodule Rubic.Helper do

  def rotate_side(cube,side,clockwise?) when clockwise? == true  do
    Map.get_and_update(cube,side, fn s ->
      new_side =
      s
      |> Stream.cycle()
      |> Stream.drop(9)
      |> Enum.take(12)
      {s,new_side}
    end)
    |>elem(1)
  end
  def rotate_side(cube,side,clockwise?) when clockwise? == false  do
    Map.get_and_update(cube,side, fn s ->
      new_side =
      s
      |> Stream.cycle()
      |> Stream.drop(3)
      |> Enum.take(12)
      {s,new_side}
    end)
    |>elem(1)
  end
  def get_pairs(side,cube) when side == :right or side ==:left do
    list=[:horizontal_up_side,:front_face_side,:horizontal_down_side,:front_back_side]
    tail=[:horizontal_middle_side,:front_middle_side]
    get_pairs_helper(list,tail,side,cube)
  end

  def get_pairs(side,cube) when side == :front or side ==:back do
    list=[:vertical_left_side,:horizontal_down_side,:vertical_right_side,:horizontal_up_side]
    tail=[:vertical_middle_side,:horizontal_middle_side]
    get_pairs_helper(list,tail,side,cube)
  end

  def get_pairs(side,cube) when side == :up or side ==:down do
    list=[:vertical_left_side,:front_face_side,:vertical_right_side,:front_back_side]
    tail=[:vertical_middle_side,:front_middle_side]
    get_pairs_helper(list,tail,side,cube)
  end


  def get_pairs_helper(list,tail,side,cube) when side in [:right,:front,:up] do
    list_last= list
    |> Stream.cycle()
    |> Stream.drop(1)
    |> Enum.take(4)
    {first_part,last_part}=list++ tail ++ list_last ++ Enum.reverse(tail)
    |> Enum.chunk_every(2)
    |> Enum.map(fn [a,b] -> {a,Map.get(cube,b)}end )
    |> Enum.split(3)
    [first_part,last_part]
end
def get_pairs_helper(list,tail,side,cube)when side not in [:right,:front,:up] do
  list_first=list
  |> Stream.cycle()
  |> Stream.drop(3)
  |> Enum.take(4)
  |> Enum.reverse()

  {first_part,last_part}=list_first ++ tail ++ Enum.reverse(list) ++ Enum.reverse(tail)
  |> Enum.chunk_every(2)
  |> Enum.map(fn [a,b] -> {a,Map.get(cube,b)} end )
  |> Enum.split(3)
  [first_part,last_part]
end
def create_lists(side,prime?) when prime? == false do
  case side do
    :right -> create_list_1(:right,11,8)
    :left -> create_list_1(:left,5,6)
    :up -> create_list_1(:up,5,9)
    :down -> create_list_1(:down,11,11)
    :front -> create_list_1(:front,2,2)
    :back -> create_list_1(:back,8,0)
    :m_move -> create_list(:m_move,4,7)
    :e_move -> create_list(:e_move,4,4)
    :s_move -> create_list(:s_move,1,1)
  end
end
def create_lists(side,prime?) when prime? == true do
  case side do
    :right -> create_list_2(:right,11,8)
    :left -> create_list_2(:left,5,6)
    :up -> create_list_2(:up,5,9)
    :down -> create_list_2(:down,11,11)
    :front -> create_list_2(:front,2,2)
    :back -> create_list_2(:back,8,0)
    :m_move -> create_list(:m_move,4,1)
    :e_move -> create_list(:e_move,4,10)
    :s_move -> create_list(:s_move,1,7)
  end
end
def create_list(side,a,b) when side in [:m_move,:e_move,:s_move] do
  list_a = Enum.map([a,a+6],&(Integer.mod(&1,12)))
  list_b = Enum.map([b,b+6],&(Integer.mod(&1,12)))
  [Enum.zip(list_a,list_b)] ++ [Enum.zip(list_b,Enum.reverse(list_a))]
  #|>Enum.split(5)
end

def create_list_1(side,a,b) when side in [:right,:down,:front] do
  list_a = Enum.map(a..a+4,&(Integer.mod(&1,12)))
  list_b = Enum.map(b..b+4,&(Integer.mod(&1,12)))
  [Enum.zip(list_a,list_b)] ++ [Enum.zip(list_b,Enum.reverse(list_a))]
  #|>Enum.split(5)
end
def create_list_1(side,a,b) when side in [:left,:up,:back] do
  list_a = Enum.map(a..a+4,&(Integer.mod(&1,12)))
  list_b = Enum.map(b..b-4,&(Integer.mod(&1,12)))
  [Enum.zip(list_a,list_b)] ++ [Enum.zip(list_b,Enum.reverse(list_a))]
  #|>Enum.split(5)
end
def create_list_2(side,a,b) when side in [:right,:down,:front] do
  list_a = Enum.map(a..a+4,&(Integer.mod(&1,12)))
  list_b = Enum.map(b+4..b,&(Integer.mod(&1,12)))
  [Enum.zip(list_a,list_b)] ++ [Enum.zip(list_b,Enum.reverse(list_a))]
  #|>Enum.split(5)
end
def create_list_2(side,a,b) when side in [:left,:up,:back] do
  list_a = Enum.map(a..a+4,&(Integer.mod(&1,12)))
  list_b = Enum.map(b-4..b,&(Integer.mod(&1,12)))
  [Enum.zip(list_a,list_b)] ++ [Enum.zip(list_b,Enum.reverse(list_a))]
  #|>Enum.split(5)
end
end
