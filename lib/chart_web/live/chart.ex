defmodule ChartWeb.ChartLive.Index do
  use ChartWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="chart">
      ChartWeb.ChartLive.Index
    </div>
    """
  end
end
