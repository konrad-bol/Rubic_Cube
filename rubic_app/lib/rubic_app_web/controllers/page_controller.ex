defmodule RubicAppWeb.PageController do
  use RubicAppWeb, :controller
  alias RubicAppWeb.Router.Helpers, as: Routes

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def new_rubic(conn, _params) do
    conn
    |> assign(:cube, %Rubic{})
    |>put_session(:list_of_hints,[])
    |> assign(:list_of_hints, [])
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> put_session(:cube, %Rubic{})
    |> render(:rubic, layout: false)
  end

  def r_move(conn, _params) do
    conn
    |> get_session(:cube)
    |> Rubic.Fun.right()
    |> render_rubic(conn)
  end

  def l_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.left()
      |> render_rubic(conn)
  end

  def u_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.up()
      |> render_rubic(conn)
  end

  def d_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.down()
      |> render_rubic(conn)
  end

  def f_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.front()
      |> render_rubic(conn)
  end

  def b_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.back()
      |> render_rubic(conn)
  end

  def r_prime_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.right_prime()
      |> render_rubic(conn)
  end

  def l_prime_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.left_prime()
      |> render_rubic(conn)
  end

  def u_prime_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.up_prime()
      |> render_rubic(conn)
  end

  def d_prime_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.down_prime()
      |> render_rubic(conn)
  end

  def f_prime_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.front_prime()
      |> render_rubic(conn)
  end

  def b_prime_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.back_prime()
      |> render_rubic(conn)
  end

  def e_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.e_move()
      |> render_rubic(conn)
  end

  def s_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.s_move()
      |> render_rubic(conn)
  end

  def m_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.m_move()
      |> render_rubic(conn)
  end

  def x_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.x_move()
      |> render_rubic(conn)
  end

  def y_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.y_move()
      |> render_rubic(conn)
  end

  def z_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.z_move()
      |> render_rubic(conn)
  end

  def e_prime_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.e_move_prime()
      |> render_rubic(conn)
  end

  def s_prime_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.s_move_prime()
      |> render_rubic(conn)
  end

  def m_prime_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.m_move_prime()
      |> render_rubic(conn)
  end

  def x_prime_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.x_move_prime()
      |> render_rubic(conn)
  end

  def y_prime_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.y_move_prime()
      |> render_rubic(conn)
  end

  def z_prime_move(conn, _params) do
      conn
      |> get_session(:cube)
      |> Rubic.Fun.z_move_prime()
      |> render_rubic(conn)
  end

  def move(conn, %{"move_value" => move_value}) do
      conn
      |> get_session(:cube)
      |> Rubic.User.multiple_move(move_value)
      |> render_rubic(conn)
  end

  def mix_cube(conn, _parms) do
      conn
      |> get_session(:cube)
      |> Rubic.User.mix_cube()
      |> render_rubic(conn)
  end

  def solve_cube(conn, _parms) do
    cube =
      conn
      |> get_session(:cube)

    {_new_cube, hint} =
      conn
      |> get_session(:cube)
      |> Solver.Solver.solve_cube()

    hints =
      hint
      |> String.trim_leading(" ")
      |> String.split()

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> put_session(:list_of_hints, hints)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, 0)
    |> assign(:current_hint_index, 0)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def prev_hint(conn, _params) do
    cube =
      conn
      |> get_session(:cube)

    current_index = get_session(conn, :current_hint_index) || 0
    hints = get_session(conn, :list_of_hints)

    new_index =
      if current_index > 0 do
        current_index - 1
      else
        current_index
      end

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> put_session(:list_of_hints, hints)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, new_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:current_hint_index, new_index)
    |> render(:rubic, layout: false)
  end

  def next_hint(conn, _params) do
    cube =
      conn
      |> get_session(:cube)

    current_index = get_session(conn, :current_hint_index) || 0
    hints = get_session(conn, :list_of_hints)

    new_index =
      if current_index < length(hints) do
        current_index + 1
      else
        current_index
      end

    hints =
      if current_index == length(hints) - 1 do
        []
      else
        hints
      end

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> put_session(:list_of_hints, hints)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, new_index)
    |> assign(:current_hint_index, new_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> render(:rubic, layout: false)
  end
  defp render_rubic(cube, conn) do
    current_index = get_session(conn, :current_hint_index) || 0
    hints = get_session(conn, :list_of_hints) || []

    conn
    |> put_session(:cube, cube)
    |> put_session(:current_hint_index, current_index)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> assign(:current_hint_index, current_index)
   |> assign(:form, Phoenix.HTML.FormData.to_form(%{}, as: :rubic))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

end
