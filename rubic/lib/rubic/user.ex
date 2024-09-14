defmodule Rubic.User do
alias Rubic.Fun
def mix_cube(cube) do
  list=["R","R'","L","L'","U","U'","F","F'","D","D'","B","B'","E","E'","S","S'","M","M'"]
  |>Enum.shuffle()
  |>Stream.cycle()
  |>Enum.take(100)
  |>Enum.shuffle()
  |>Enum.take(20)
  |>Enum.reduce(cube,fn move, cube ->
    cube= move_string(cube,move)
  end)
end
  def multiple_move(cube,moves) do
    Regex.replace(~r/(.`|.'|.)/,moves,"\\1,")
    |>String.replace("`","'")
    |>String.trim_trailing(",")
    |>String.split(",")

    |>IO.inspect()
    |>Enum.reduce(cube,fn move, cube ->
      cube= move_string(cube,move)
    end)
  end
  def move_string(cube,"R"), do: Fun.right(cube)
  def move_string(cube,"R'"), do: Fun.right_prime(cube)
  def move_string(cube,"S"), do: Fun.s_move(cube)
  def move_string(cube,"S'"), do: Fun.s_move_prime(cube)
  def move_string(cube,"L"), do: Fun.left(cube)
  def move_string(cube,"L'"), do: Fun.left_prime(cube)
  def move_string(cube,"D"), do: Fun.down(cube)
  def move_string(cube,"D'"), do: Fun.down_prime(cube)
  def move_string(cube,"U"), do: Fun.up(cube)
  def move_string(cube,"U'"), do: Fun.up_prime(cube)
  def move_string(cube,"M"), do: Fun.m_move(cube)
  def move_string(cube,"M'"), do: Fun.m_move_prime(cube)
  def move_string(cube,"F"), do: Fun.front(cube)
  def move_string(cube,"F'"), do: Fun.front_prime(cube)
  def move_string(cube,"E"), do: Fun.e_move(cube)
  def move_string(cube,"E'"), do: Fun.e_move_prime(cube)
  def move_string(cube,"B"), do: Fun.back(cube)
  def move_string(cube,"B'"), do: Fun.back_prime(cube)
  def move_string(cube,"X"), do: Fun.x_move(cube)
  def move_string(cube,"X'"), do: Fun.x_move_prime(cube)
  def move_string(cube,"Y"), do: Fun.y_move(cube)
  def move_string(cube,"Y'"), do: Fun.y_move_prime(cube)
  def move_string(cube,"Z"), do: Fun.z_move(cube)
  def move_string(cube,"Z'"), do: Fun.z_move_prime(cube)

end
