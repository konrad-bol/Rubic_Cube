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
    |> assign(:list_of_hints, [])
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> put_session(:cube, %Rubic{})
    |> render(:rubic, layout: false)
  end

  def r_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.right()

    hints =
      conn
      |> get_session(:list_of_hints)

    IO.inspect(hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def l_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.left()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def u_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.up()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def d_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.down()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def f_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.front()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def b_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.back()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def r_prime_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.right_prime()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def l_prime_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.left_prime()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def u_prime_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.up_prime()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def d_prime_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.down_prime()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def f_prime_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.front_prime()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def b_prime_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.back_prime()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def e_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.e_move()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def s_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.s_move()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def m_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.m_move()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def x_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.x_move()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def y_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.y_move()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def z_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.z_move()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def e_prime_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.e_move_prime()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def s_prime_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.s_move_prime()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def m_prime_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.m_move_prime()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def x_prime_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.x_move_prime()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def y_prime_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.y_move_prime()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def z_prime_move(conn, _params) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.Fun.z_move_prime()

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def move(conn, %{"move_value" => move_value}) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.User.multiple_move(move_value)

    hints =
      conn
      |> get_session(:list_of_hints)

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, hints)
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def mix_cube(conn, _parms) do
    current_index = get_session(conn, :current_hint_index) || 0

    cube =
      conn
      |> get_session(:cube)
      |> Rubic.User.mix_cube()

    conn
    |> put_session(:cube, cube)
    |> assign(:cube, cube)
    |> assign(:list_of_hints, [])
    |> put_session(:list_of_hints, [])
    |> put_session(:current_hint_index, current_index)
    |> assign(:current_hint_index, current_index)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess" => 3}, as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic, layout: false)
  end

  def solve_cube(conn, _parms) do
    cube =
      conn
      |> get_session(:cube)

    {new_cube, hint} =
      conn
      |> get_session(:cube)
      |> Solver.Solver.solve_cube()
      |> IO.inspect()

    # |> Solver.Cross.Searcher.make_cross()
    # |> Solver.Corner.Searcher.make_corner()
    # |> Solver.Middle.Searcher.make_2l()
    # |> Solver.UperCross.Cross.make_upercross()
    # |> Solver.UperCorner.Corner.make_corner()
    hints =
      hint
      |> String.trim_leading(" ")
      |> String.split()
      |> IO.inspect()

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
end
