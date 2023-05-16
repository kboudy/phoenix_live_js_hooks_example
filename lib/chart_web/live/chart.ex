defmodule ChartWeb.ChartLive.Index do
  use ChartWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       # note: not using atom keys here,
       #       because json will be converted to a map with string keys
       clicked_coords: nil
     )}
  end

  def render(assigns) do
    ~H"""
    <div id="chartjs-demo">
      <div phx-update="ignore" id="chartjs-wrapper">
        <canvas id="line-chart" phx-hook="Chart"></canvas>
      </div>

      <div :if={@clicked_coords} class="text-center mt-10">
        <%= "you clicked: #{@clicked_coords["x"]}, #{@clicked_coords["y"]}" %>
      </div>
    </div>
    """
  end

  def handle_event("chart-clicked", coords, socket) do
    socket =
      socket
      |> assign(:clicked_coords, coords)
      |> push_event("set-chart-data", coords)

    {:noreply, socket}
  end
end
