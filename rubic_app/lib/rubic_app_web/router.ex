defmodule RubicAppWeb.Router do
  use RubicAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {RubicAppWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RubicAppWeb do
    pipe_through :browser

    get "/", PageController, :home

    get "/rubic", PageController, :new_rubic
    put "/rubic/r", PageController, :r_move
    put "/rubic/l", PageController, :l_move
    put "/rubic/u", PageController, :u_move
    put "/rubic/d", PageController, :d_move
    put "/rubic/f", PageController, :f_move
    put "/rubic/b", PageController, :b_move
    put "/rubic/rp", PageController, :r_prime_move
    put "/rubic/lp", PageController, :l_prime_move
    put "/rubic/up", PageController, :u_prime_move
    put "/rubic/dp", PageController, :d_prime_move
    put "/rubic/fp", PageController, :f_prime_move
    put "/rubic/bp", PageController, :b_prime_move
  end

  # Other scopes may use custom stacks.
  # scope "/api", RubicAppWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:rubic_app, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: RubicAppWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
