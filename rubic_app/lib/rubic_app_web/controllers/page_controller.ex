defmodule RubicAppWeb.PageController do
  use RubicAppWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
  def new_rubic(conn,_params) do

    conn
    |> assign(:cube,%Rubic{})
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move"))
    |> assign(:method, :put)
    |> put_session(:cube,%Rubic{})
    |> render(:rubic, layout: false)
  end
  def r_move(conn,_params) do
    cube = conn
    |> get_session(:cube)
    |> Rubic.Fun.right()
    conn
    |> put_session(:cube,cube)
    |> assign(:cube,cube)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic,layout: false)
  end
  def l_move(conn,_params) do
    cube = conn
    |> get_session(:cube)
    |> Rubic.Fun.left()
    conn
    |> put_session(:cube,cube)
    |> assign(:cube,cube)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic,layout: false)
  end
  def u_move(conn,_params) do
    cube = conn
    |> get_session(:cube)
    |> Rubic.Fun.up()
    conn
    |> put_session(:cube,cube)
    |> assign(:cube,cube)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic,layout: false)
  end
  def d_move(conn,_params) do
    cube = conn
    |> get_session(:cube)
    |> Rubic.Fun.down()
    conn
    |> put_session(:cube,cube)
    |> assign(:cube,cube)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic,layout: false)
  end
  def f_move(conn,_params) do
    cube = conn
    |> get_session(:cube)
    |> Rubic.Fun.front()
    conn
    |> put_session(:cube,cube)
    |> assign(:cube,cube)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic,layout: false)
  end
  def b_move(conn,_params) do
    cube = conn
    |> get_session(:cube)
    |> Rubic.Fun.back()
    conn
    |> put_session(:cube,cube)
    |> assign(:cube,cube)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic,layout: false)
  end
  def r_prime_move(conn,_params) do
    cube = conn
    |> get_session(:cube)
    |> Rubic.Fun.right_prime()
    conn
    |> put_session(:cube,cube)
    |> assign(:cube,cube)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic,layout: false)
  end
  def l_prime_move(conn,_params) do
    cube = conn
    |> get_session(:cube)
    |> Rubic.Fun.left_prime()
    conn
    |> put_session(:cube,cube)
    |> assign(:cube,cube)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic,layout: false)
  end
  def u_prime_move(conn,_params) do
    cube = conn
    |> get_session(:cube)
    |> Rubic.Fun.up_prime()
    conn
    |> put_session(:cube,cube)
    |> assign(:cube,cube)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic,layout: false)
  end
  def d_prime_move(conn,_params) do
    cube = conn
    |> get_session(:cube)
    |> Rubic.Fun.down_prime()
    conn
    |> put_session(:cube,cube)
    |> assign(:cube,cube)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic,layout: false)
  end
  def f_prime_move(conn,_params) do
    cube = conn
    |> get_session(:cube)
    |> Rubic.Fun.front_prime()
    conn
    |> put_session(:cube,cube)
    |> assign(:cube,cube)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic,layout: false)
  end
  def b_prime_move(conn,_params) do
    cube = conn
    |> get_session(:cube)
    |> Rubic.Fun.back_prime()
    conn
    |> put_session(:cube,cube)
    |> assign(:cube,cube)
    |> assign(:form, Phoenix.HTML.FormData.to_form(%{"guess"=> 3},as: "make_move"))
    |> assign(:method, :put)
    |> render(:rubic,layout: false)
  end
end