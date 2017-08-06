module DashboardsHelper
  def place_widget(widget)
    "<div style='zoom: 100.5%; padding-left: #{widget.pos_x}px; padding-top: #{widget.pos_y}px;'>#{widget.code}</div>".html_safe
  end
end
